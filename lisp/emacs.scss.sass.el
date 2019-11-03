(require 'sass-mode)
(require 'scss-mode)

(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
; disable the flycheck-mode when in sass-mode
(add-hook 'sass-mode-hook (lambda () (flycheck-mode -1)))

(provide 'emacs.scss.sass)
