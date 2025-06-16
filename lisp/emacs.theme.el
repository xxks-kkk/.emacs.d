;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(modus-operandi))

(defun my/set-theme-for-frame (frame)
  "Set the theme for a new frame based on its display type."
  (with-selected-frame frame
    (if (display-graphic-p)
        (load-theme 'modus-operandi t)
      (load-theme 'modus-vivendi t))))

;; Set theme for initial frame
(my/set-theme-for-frame (selected-frame))

;; Set theme for subsequent frames
(add-hook 'after-make-frame-functions #'my/set-theme-for-frame)




(provide 'emacs.theme)
