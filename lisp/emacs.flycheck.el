; enable flycheck
(use-package flycheck
  :ensure t
  :init
  (setq global-flycheck-mode t)
    ;; Add company-mode to the mode hooks for the list of modes given
  :hook (
      ((prog-mode lisp-mode c-mode-common perl-mode python-mode lua-mode sh-mode makefile-mode emacs-lisp-mode) . flycheck-mode)
      )
  :config
    ;; enable flycheck-rust
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
  (with-eval-after-load 'python-mode
    (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))
  )


(provide 'emacs.flycheck)
