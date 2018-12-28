(use-package command-log-mode
  :ensure t
  :init
  (setq clm/logging-dir "~/.emacs.d/log/")
  :hook (
      ((prog-mode lisp-mode lisp-interaction-mode c-mode-common perl-mode python-mode lua-mode sh-mode makefile-mode emacs-lisp-mode) . command-log-mode)
    )
  )

(provide 'emacs.command.log.mode)
