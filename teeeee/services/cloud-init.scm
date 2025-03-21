;; Copyright © 2021 David Dashyan <mail@davie.li>

(define-module (teeeee services cloud-init)
  #:use-module (gnu services base)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages package-management)
  #:use-module (guix channels)
  #:use-module (guix describe)
  #:use-module (guix gexp)
  #:use-module (guix inferior)
  #:use-module (guix modules)
  #:use-module (guix records)
  #:use-module (ice-9 match)
  #:use-module (rnrs bytevectors)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-11)
  #:use-module (web client)
  #:use-module (web response)
  #:use-module (web uri)
  #:export (cloud-init-service-type
            cloud-init-config
            cloud-init-config?
            cloud-init-config-metadata-host
            cloud-init-config-metadata-port
            make-resize-filesystem-gexp
            make-cloud-init-config))

(define %metadata-host
  (make-parameter "169.254.169.254"))

(define %metadata-port
  (make-parameter 80))

(define %metadata-path
  (make-parameter "/metadata/v1.json"))

(define %root-blk
  (make-parameter "/dev/vda"))

(define %root-prt
  (make-parameter "/dev/vda2"))

(define-record-type* <cloud-init-config>
  cloud-init-config make-cloud-init-config
  cloud-init-config?
  (metadata-host cloud-init-config-metadata-host
                 (default (%metadata-host)))
  (metadata-path cloud-init-config-metadata-path
                 (default (%metadata-path)))
  (root-blk cloud-init-config-root-blk
            (default (%root-blk)))
  (root-prt cloud-init-config-root-prt
            (default (%root-prt)))
  (log-file      cloud-init-config-file
                 (default "/var/log/cloud-init.log"))
  (get-gexp      cloud-init-config-get-gexp
                 ;; thunk returning a replacement gexp
                 (default make-cloud-init-gexp))
  (requirements  cloud-init-config-requirements
                 (default '()))) ;; + loopback

(define* (query-metadata)
  (with-extensions (list guile-json-3)   ;for (guix store database)
    (with-imported-modules (source-module-closure '((json)))
      #~(begin
          (use-modules (json)
                       (ice-9 match)
                       (web client)
                       (web request)
                       (web response)
                       (web uri)
                       (rnrs bytevectors))
          (let* ((xhost #$(%metadata-host))
                 (xpath #$(%metadata-path))
                 (xport #$(%metadata-port))
                 (uri (build-uri
                       'http #:host xhost #:path xpath #:port xport))
                 (addr (cond
                        ((equal? xhost "localhost") INADDR_LOOPBACK)
                        ((string? xhost) (inet-pton AF_INET xhost))
                        (else (throw 'invalid-host))))
                 (sock (socket PF_INET SOCK_STREAM 0))
                 (port-available? (lambda ()
                                    (let loop ((i 0))
                                      (catch 'system-error
                                        (lambda ()
                                          (connect sock AF_INET addr xport)
                                          (close-port sock)
                                          #t)
                                        (lambda _
                                          (if (< i 20)
                                              (begin
                                                (sleep 1)
                                                (loop (+ 1 i)))
                                              #f)))))))
            (call-with-values
                (lambda ()
                  (if (port-available?)
                      (http-request uri #:method 'GET)
                      (throw 'port-unavailable)))
              (lambda (response body)
                (if
                 (eq? (response-code response) 200)
                 (match body
                   ((? string?)     (json-string->scm body))
                   ((? bytevector?) (json-string->scm (utf8->string body))))
                 (throw 'metadata-query-error response)))))))))

(define hwaddress-inerface-name-alist-gexp
  ;; XXX: Linux specific
  #~(begin
      (use-modules (ice-9 match))
      (map
       (lambda (name)
         ;; Make (mac-address . interface-name) pair
         (call-with-input-file
             (string-append "/sys/class/net/" name "/address")
           (lambda (file) (cons (string-trim-both (get-string-all file))
                                name))))
       ;; interface names list
       (let ((dir-stream (opendir "/sys/class/net")))
         (let rec ((iface-names '())
                   (iname (readdir dir-stream)))
           (match iname
             ((? eof-object?) (begin (closedir dir-stream) iface-names))
             ((or "." "..")   (rec iface-names (readdir dir-stream)))
             (else            (rec (cons iname iface-names)
                                   (readdir dir-stream)))))))))

(define (make-resize-filesystem-gexp)
  (let ((select? (match-lambda
                   (('parted rest ...)         #t)
                   (('bytestructures rest ...) #t)
                   (_ #f)))
        (device-file (%root-blk))
        (partition-file (%root-prt)))
    (with-extensions (list guile-parted guile-bytestructures)
      #~(begin
          (use-modules (parted))
          (let* ((device     (get-device #$device-file))
                 (disk       (disk-new device))
                 (partition  (disk-get-partition disk 2))
                 (constraint (device-get-optimal-aligned-constraint
                              device)))
            (disk-maximize-partition disk partition constraint)
            (disk-commit disk)
            (system* "/run/current-system/profile/sbin/resize2fs"
                     #$partition-file))))))

(define (make-cloud-init-gexp)
  (with-imported-modules '((guix build syscalls))
    #~(begin
        (use-modules (guix build syscalls)
                     (ice-9 match)
                     (ice-9 textual-ports)
                     (guix build utils)
                     (srfi srfi-43))
        (let-syntax ((ref (syntax-rules ()
                            ;; nested assoc-ref for working with json alists
                            ;; (ref '((a . ((b . hello!)))) 'a 'b) => 'hello!
                            ((_ alist key key* ...)
                             (let rec ((al alist) (kl (list key key* ...)))
                               (match kl
                                 (() al)
                                 (_  (rec (assoc-ref al (car kl))
                                          (cdr kl)))))))))
          ;; random conf NOTE: do we need it?
          (configure-network-interface
           "eth0"
           (make-socket-address AF_INET (inet-pton AF_INET "169.254.100.100") 0)
           (logior IFF_UP 0)
           #:netmask (make-socket-address AF_INET (inet-pton AF_INET "255.255.0.0") 0))

          ;; Metadata vars
          (let* ((metadata           #$(query-metadata))
                 (dhcp-enabled       (ref metadata "features" "dhcp_enabled"))
                 (public-keys        (ref metadata "public_keys"))
                 (public-interfaces  (ref metadata "interfaces" "public"))
                 (private-interfaces (ref metadata "interfaces" "private"))
                 (name-servers       (ref metadata "dns" "nameservers"))
                 (hwaddr-name-alist  #$hwaddress-inerface-name-alist-gexp))

            ;; set iface down NOTE: do we need it?
            (let ((sock (socket AF_INET SOCK_STREAM 0)))
              (set-network-interface-flags sock "eth0" 0) ;; FIXME
              (close-port sock))

            ;; Configuring network
            (for-each
             (lambda (iface-info)
               (let* ((addr-str    (ref iface-info "ipv4" "ip_address"))
                      (addr        (inet-pton AF_INET addr-str))
                      (sockaddr    (make-socket-address AF_INET addr 0))
                      (mask-str    (ref iface-info "ipv4" "netmask"))
                      (mask        (inet-pton AF_INET mask-str))
                      (maskaddr    (make-socket-address AF_INET mask 0))
                      (gateway-str (ref iface-info "ipv4" "gateway"))
                      (gateway     (inet-pton AF_INET gateway-str))
                      (gatewayaddr (make-socket-address AF_INET gateway 0))
                      (iface-name  (assoc-ref hwaddr-name-alist
                                              (string-downcase
                                               (ref iface-info "mac")))))
                 (configure-network-interface
                  ;; ignoring loopback here
                  iface-name sockaddr IFF_UP #:netmask maskaddr)
                 (when gateway
                   (let ((sock (socket AF_INET SOCK_DGRAM 0)))
                     (add-network-route/gateway sock gatewayaddr)
                     (close-port sock)))))
             (vector->list public-interfaces))
            (display "Inserting ssh keys\n")
            (mkdir-p "/root/.ssh")
            (call-with-output-file "/root/.ssh/authorized_keys"
              (lambda (f)
                (for-each (lambda (key) (display key f) (newline f))
                          ;; vector-for-each is unbound here for some reason
                          (vector->list (ref metadata "public_keys")))))

            (display "Populating /etc/resolv.conf...\n")
            (call-with-output-file "/etc/resolv.conf"
              (lambda (f)
                (let ((content (string-append
                                "# Generated by 'cloud-init-service'.\n"
                                (string-join
                                 (map (lambda (x) (string-append "nameserver " x))
                                      (vector->list name-servers))
                                 "\n" 'suffix))))
                  (display content f))))

            (display "Resizing partition...\n")
            #$(make-resize-filesystem-gexp))))))

(define (with-gexp-logger file xgexp)
  #~(with-output-to-file #$file
      (lambda ()
        (with-exception-handler
            (lambda (err)
              (display ";;; Exiting with error:\n")
              (display err)
              (newline)
              (force-output))
          (lambda ()
            (display ";;; Log start\n")
            #$xgexp)))))

(define (cloud-init-shepherd-service config)
  (match-record config <cloud-init-config>
                (metadata-host metadata-path root-blk root-prt
                               log-file get-gexp requirements)
    (shepherd-service
     (provision '(cloud-init))
     (documentation "Configure system")
     (requirement `(user-processes loopback ,@requirements))
     (start #~(lambda _
                #$(with-gexp-logger
                   log-file
                   (parameterize ((%metadata-host metadata-host)
                                  (%metadata-path metadata-path)
                                  (%root-blk root-blk)
                                  (%root-prt root-prt))
                     (get-gexp)))))
     (stop #~(lambda _ #t))
     (respawn? #f)
     (modules `((parted)
                (ice-9 match)
                (guix build syscalls)
                (web client)
                (web request)
                (web response)
                (web uri)
                ,@%default-modules)))))

(define cloud-init-service-type
  (service-type
   (name 'cloud-init)
   (description "")
   (extensions
    (list (service-extension shepherd-root-service-type
                             (compose list cloud-init-shepherd-service))))
   (default-value (cloud-init-config))))
