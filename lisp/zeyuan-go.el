;;----------------------------------
;; Go mode
;;----------------------------------

(require 'go-mode)
(define-key go-mode-map (kbd "<f5>") 'godef-jump-other-window)
(add-hook 'before-save-hook #'gofmt-before-save)

(provide 'zeyuan-go)
