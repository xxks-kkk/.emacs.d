;;----------------------------------
;; Go mode
;;----------------------------------

(require 'go-mode)
(add-hook 'before-save-hook #'gofmt-before-save)

(provide 'zeyuan-go)
