; enable flycheck
(use-package flycheck
  :ensure t
  :init
    ;; Add company-mode to the mode hooks for the list of modes given
  :hook (
      ((prog-mode lisp-mode c-mode-common perl-mode python-mode lua-mode sh-mode makefile-mode emacs-lisp-mode yaml-mode) . flycheck-mode)
      )
  :config
    ;; enable flycheck-rust
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
    ;; enale flycheck-python
  (with-eval-after-load 'python-mode
    (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))
  (with-eval-after-load 'yaml-mode
    (add-hook 'flycheck-mode-hook #'flycheck-yamllint-setup))
  )

(add-hook 'python-mode-hook
          (lambda ()
            (setq flycheck-python-pylint-executable "/usr/local/bin/pylint")))

(add-hook 'yaml-mode-hook
          (lambda()
            (setq flycheck-yaml-yamllint-executable "/usr/bin/yamllint")))

(provide 'emacs.flycheck)

;;; emacs.flycheck ends here
