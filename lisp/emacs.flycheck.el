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

(add-hook 'python-mode-hook
          (lambda ()
            (setq flycheck-python-pylint-executable "/usr/local/bin/pylint")))

; See issue: https://github.com/flycheck/flycheck/issues/1523
(let ((govet (flycheck-checker-get 'go-vet 'command)))
  (when (equal (cadr govet) "tool")
    (setf (cdr govet) (cddr govet))))

(provide 'emacs.flycheck)
