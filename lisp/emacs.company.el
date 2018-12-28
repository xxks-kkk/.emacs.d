;; Company is an auto-completion tool that can use various backends to retrieve possible completions
;; It's significantly better maintained than auto-complete, which is one of the main alternatives

(use-package company
  :ensure t
  :init
  (setq company-global-modes t)
  (setq company-tooltip-align-annotations t)
  ;; Add company-mode to the mode hooks for the list of modes given
  :hook (
      ((prog-mode lisp-mode c-mode-common perl-mode python-mode lua-mode sh-mode makefile-mode emacs-lisp-mode) . company-mode)
    )
)

(provide 'emacs.company)
