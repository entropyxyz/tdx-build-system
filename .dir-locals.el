;; Per-directory local variables for GNU Emacs 23 and later.

((nil
  .
  ((fill-column . 78)
   (tab-width   .  8)
   (sentence-end-double-space . t)
   (whitespace-cleanup-mode-only-if-initially-clean)
   (eval . (add-to-list 'completion-ignored-extensions ".go"))))
 (prog-mode
  .
  ((mode . whitespace-cleanup)))
 (scheme-mode
  .
  ;; This is a temporary setting until dependency on guix is removed
  ;; (if ever).
  ((geiser-guile-binary
    .
    ("guix" "shell" "guile" "guile-parted" "guile-bytestructures"
     "--" "guix" "repl"))
   (indent-tabs-mode . nil))))
