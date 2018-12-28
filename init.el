;; Load my personal customization files from ~/.emacs.d/lisp
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; setup package repo
(require 'zeyuan-elpa)

; install necessary packages
(require 'emacs.packages)

; configure packages
(require 'emacs.fill.column.indicator)
(require 'emacs.golden.ratio)
(require 'emacs.theme)
(require 'emacs.ui)



(require 'zeyuan-mac)
(require 'zeyuan-perl)
(require 'zeyuan-cpp)
(require 'zeyuan-key-shortcuts)
(require 'zeyuan-others)
(require 'zeyuan-rust)



; activation org mode
; Ref: http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

; use graphviz-dot-mode
(add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode))


; Auto show completions for execute-extended-command
(icomplete-mode 1)

; Deactive tabs to be used for indentation (force myself to use space for indentation)
(setq-default indent-tabs-mode nil)

; Make whitespace-mode use just basic coloring
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))

; Differentiate two names when files are the same
(require 'uniquify)
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

;; ; Activates the auto-comple mode and enable AC mode everywhere
(require 'auto-complete)
(global-auto-complete-mode t)
(defun auto-complete-mode-maybe ()
 (auto-complete-mode 1))
(require 'auto-complete-config)
(ac-config-default)

; let's define a function which intializes auto-complete-c-headers and gets
; called for c/c++ hooks
(defun my:ac-c-headers-init ()
(require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (setq achead:include-directories
   (append '("/usr/include/c++/7"
             "/usr/include/x86_64-linux-gnu/c++/7"
             "/usr/include/c++/7/backward"
             "/usr/lib/gcc/x86_64-linux-gnu/7/include"
             "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed"
             "/usr/include/x86_64-linux-gnu")
             achead:include-directories)))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)

; enable dumb-jump-mode
(dumb-jump-mode 1)
(setq dumb-jump-prefer-searcher 'ag)

; neotree show hidden files
(setq-default neo-show-hidden-files t)

; yasnippet configuration
(require 'yasnippet)
; uncomment and set customized snippet location
;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/elpa/yasnippet-snippets-20181211.2219/snippets"
;;         ))
(yas-global-mode 1)

; enable flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

; enable flycheck-rust
(with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))


(provide 'init)
;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
