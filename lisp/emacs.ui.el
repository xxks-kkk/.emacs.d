;;; Emacs display config

;; you won't need any of the bar thingies
;; turn it off to save screen estate
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

; Enable "Which function mode". It will show you which function cursor is in
(which-function-mode 1)

; Disable Emacs welcome screen
(setq inhibit-startup-message t)

; Set font type & size
'(default ((t (:height 140 :family "DejaVu Sans Mono")))) ;notice, the value is in 1/10pt, so 120 will be 12pt
(set-face-attribute 'default nil :height 160)

;; Makes *scratch* empty.
(setq initial-scratch-message "")

; Disable the ring bell
(setq ring-bell-function 'ignore)

;; Highlight current line
(global-hl-line-mode 1)

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
          '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
                    (kill-buffer buffer)))))

(setq
 x-select-enable-clipboard t
 x-select-enable-primary t
 save-interprogram-paste-before-kill t
 apropos-do-all t
 mouse-yank-at-point t)

; Highlights the matching pair when the point is over parentheses
(show-paren-mode 1)

(provide 'emacs.ui)
