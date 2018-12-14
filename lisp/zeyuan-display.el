;;; Emacs display config

; load the theme
(load-theme 'manoj-dark)

; Disable menu bar
; (menu-bar-mode -1)

; Disable tool bar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

; Disable scroll bar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

; Forces the messages to 0, and kills the *Messages* buffer - thus disabling it on startup.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

; Enable "Which function mode". It will show you which function cursor is in
(which-function-mode 1)

; Disable Emacs welcome screen
(setq inhibit-startup-message t)

; Set font type & size
'(default ((t (:height 140 :family "DejaVu Sans Mono")))) ;notice, the value is in 1/10pt, so 120 will be 12pt
(set-face-attribute 'default nil :height 160)

;; Makes *scratch* empty.
(setq initial-scratch-message "")


(provide 'zeyuan-display)
;;; zeyuan-display.el ends here
