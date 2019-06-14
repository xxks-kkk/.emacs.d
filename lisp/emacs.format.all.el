;enable format-all
(use-package format-all
  :ensure t
  :init
  (setq format-all-mode t)
  :hook (
         ((python-mode) . format-all-mode))
  )
(provide 'emacs.format.all)
