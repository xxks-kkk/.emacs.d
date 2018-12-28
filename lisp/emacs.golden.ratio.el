; Enable Golden Ratio: resizes Emacs windows automatically to make the window
; that has the focus to have perfect size for editing.

(use-package golden-ratio
  :ensure t
  :init
  (golden-ratio-mode t)
  )

(provide 'emacs.golden.ratio)
