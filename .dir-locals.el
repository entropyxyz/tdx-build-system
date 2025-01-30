;; Per-directory local variables for GNU Emacs 23 and later.

((nil
  .
  ((eval . (add-to-list 'completion-ignored-extensions ".go"))))
 (scheme-mode
  .
  ;; This is a temporary setting until dependency on guix is removed
  ;; (if ever).
  ((geiser-guile-binary
    .
    ("guix" "shell" "guile" "guile-parted" "guile-bytestructures"
     "--" "guix" "repl"))
   (indent-tabs-mode . nil))))
