;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(modus-operandi))

(defun my/set-theme-for-frame (frame)
  "Set the theme for a new frame based on its display type."
  (with-selected-frame frame
    ;; Guard against theme load failures (e.g. modus-themes versions that need a
    ;; 30.1 Emacs) under Emacs 28 so a broken theme does not abort the rest of init.
    (ignore-errors
      (if (display-graphic-p)
          (load-theme 'modus-operandi t)
        (load-theme 'modus-vivendi t)))))

;; Set theme for initial frame
(my/set-theme-for-frame (selected-frame))

;; Set theme for subsequent frames
(add-hook 'after-make-frame-functions #'my/set-theme-for-frame)




(provide 'emacs.theme)
