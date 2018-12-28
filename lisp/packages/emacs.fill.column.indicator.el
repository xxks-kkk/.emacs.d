;Enable the 80 column rule
(use-package fill-column-indicator
  :ensure: t
  :init
  (setq fci-rule-width 1)
  (setq fci-rule-color "darkblue")
  (setq fci-rule-column 80) )

(provide 'emacs.fill.column.indicator)
