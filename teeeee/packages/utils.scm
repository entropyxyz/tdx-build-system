;;; Copyright © 2015, 2018 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2025 Maxim Cournoyer <maxim.cournoyer@gmail.com>
;;; Copyright © 2025 Maxim Cournoyer <maxim.cournoyer@gmail.com>
;;; Copyright © 2024 Poetic Technologies <hello@poeticte.ch>

(define-module (teeeee packages utils)
  #:use-module (gnu packages)
  #:use-module (guix diagnostics)
  #:use-module (guix i18n)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-34)
  #:replace (%patch-path search-patch)
  #:export (teeeee-patches
            search-patch-subtree))

;;; Commentary:
;;;
;;; This module refines the default value of some parameters from (gnu
;;; packages) and the syntax/procedures using those.  This allows
;;; 'search-paths' and friends to work without any user intervention.
;;;
;;; Code:

(define %teeeee-root-directory
  ;; This is like %distro-root-directory from (gnu packages), with adjusted
  ;; paths.
  (letrec-syntax ((dirname* (syntax-rules ()
                              ((_ file)
                               (dirname file))
                              ((_ file head tail ...)
                               (dirname (dirname* file tail ...)))))
                  (try      (syntax-rules ()
                              ((_ (file things ...) rest ...)
                               (match (search-path %load-path file)
                                 (#f
                                  (try rest ...))
                                 (absolute
                                  (dirname* absolute things ...))))
                              ((_)
                               #f))))
    (try ("teeeee/packages/utils.scm" teeeee/ packages/))))

(define %patch-path
  ;; Define it after '%package-module-path' so that '%load-path' contains user
  ;; directories, allowing patches in $GUIX_PACKAGE_PATH to be found.
  (make-parameter
      (map (lambda (directory)
             (if (string=? directory %teeeee-root-directory)
                 (string-append directory "/teeeee/packages/patches")
                 directory))
           %load-path)))

;;; XXX: The following must be redefined to make use of the overridden
;;; %patch-path parameter above.
(define (search-patch file-name)
  "Search the patch FILE-NAME.  Raise an error if not found."
  (or (search-path (%patch-path) file-name)
      (raise (formatted-message (G_ "~a: patch not found")
                                file-name))))

(define (search-patch-subtree base file-name)
  (search-patch (string-append base "/" file-name)))
