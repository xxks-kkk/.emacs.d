;;----------------------------------
;; Go mode
;;----------------------------------

(require 'go-mode)
(define-key go-mode-map (kbd "<f5>") 'godef-jump-other-window)
(add-hook 'before-save-hook #'gofmt-before-save)

; Reference:
; https://github.com/dominikh/go-mode.el/blob/ed5c2cf8688f0b603f63279d30e7166bb8ae56fe/go-guru.el
; https://johnsogg.github.io/emacs-golang
(require 'go-guru)
(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)
; Find all the referrers
(define-key go-mode-map (kbd "<f6>") 'go-guru-referrers)

(provide 'zeyuan-go)
