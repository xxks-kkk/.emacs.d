;; Load my personal customization files from ~/.emacs.d/lisp
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; setup package repo
(require 'emacs.elpa)

; install necessary packages
(require 'emacs.packages)

; configure packages
(require 'emacs.fill.column.indicator)
(require 'emacs.golden.ratio)
(require 'emacs.theme)
(require 'emacs.ui)
(require 'emacs.auto.complete)
(require 'emacs.yasnippet)
(require 'emacs.dumb.jump)

;; (require 'zeyuan-mac)
;; (require 'zeyuan-perl)
;; (require 'zeyuan-cpp)
;; (require 'zeyuan-key-shortcuts)
;; (require 'zeyuan-others)
;; (require 'zeyuan-rust)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(delete-selection-mode nil)
 '(package-selected-packages
   (quote
    (use-package flycheck auto-complete-c-headers yasnippet-classic-snippets yasnippet-snippets yasnippet dumb-jump projectile ggtags rust-mode neotree markdown-mode graphviz-dot-mode go-mode cl-generic auto-complete)))
 '(safe-local-variable-values
   (quote
    ((projectile-project-root . "/Users/zyh/Documents/projects/shuati"))))
 '(scroll-bar-mode (quote right))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))





; neotree show hidden files
(setq-default neo-show-hidden-files t)


; enable flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

; enable flycheck-rust
(with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
