;;----------------------------------
;; CC modes (C, C++, Java)
;;----------------------------------

(require 'cc-mode)
(setq c-default-style "bsd"); DB2 coding style
(setq-default c-basic-offset 2)

(define-key c-mode-base-map (kbd "<f6>") 'ggtags-find-reference)
(define-key c-mode-base-map (kbd "<f5>") 'ggtags-find-tag-dwim)

;;----------------------------------
;; LSP via eglot (built-in to Emacs 29+), backed by clangd
;; Only enable when clangd is actually available on PATH.
;;----------------------------------
(when (executable-find "clangd")
  (require 'eglot)
  (defun zeyuan-cpp-eglot-setup ()
    "Start eglot and route navigation keys through xref/LSP in C/C++.
M-. / M-, / M-? already use xref (eglot-backed) once helm-gtags is
not enabled here; we also retarget the ggtags F5/F6 keys to xref."
    (eglot-ensure)
    (local-set-key (kbd "<f5>") 'xref-find-definitions)
    (local-set-key (kbd "<f6>") 'xref-find-references))
  (add-hook 'c-mode-hook 'zeyuan-cpp-eglot-setup)
  (add-hook 'c++-mode-hook 'zeyuan-cpp-eglot-setup))

(provide 'zeyuan-cpp)
