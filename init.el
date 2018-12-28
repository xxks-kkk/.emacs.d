;; Load my personal customization files from ~/.emacs.d/lisp
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; set custom-file
(setq custom-file "~/.emacs.d/.emacs-custom.el")
(load custom-file)

; setup package repo
(require 'emacs.elpa)

; install necessary packages
(require 'emacs.packages)

; load configurations
(require 'emacs.fill.column.indicator)
(require 'emacs.golden.ratio)
(require 'emacs.theme)
(require 'emacs.ui)
(require 'emacs.auto.complete)
(require 'emacs.yasnippet)
(require 'emacs.dumb.jump)
(require 'setup-helm)
(require 'emacs.company)

;; (require 'zeyuan-mac)
;; (require 'zeyuan-perl)
;; (require 'zeyuan-cpp)
;; (require 'zeyuan-key-shortcuts)
;; (require 'zeyuan-others)
;; (require 'zeyuan-rust)







; neotree show hidden files
(setq-default neo-show-hidden-files t)


; enable flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

; enable flycheck-rust
(with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(provide 'init)
;;; init.el ends here
