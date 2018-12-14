;;;------------------------------------
;;; Tested on Emacs 23.1, 24.3.1, 26.3
;;;
;;; Aims to maximize the productivity
;;; while minimize the package to be installed 
;;; and configuration steps
;;;------------------------------------


;;;-----------------------------------
;;; OS-Level Setup:
;;;
;;; 1. Change the cursor type to "block" for terminal simulator
;;;    and set the color of cursor to #AF1212 (R:175, G:18, B:18)
;;;
;;;
;;;-----------------------------------

;;------------------------------------
;; Emacs System
;;------------------------------------


; Want Emacs to automatically run a server on startup if it's not running
(load "server")
(unless (server-running-p) (server-start))

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/elpa/")

;; Load my personal customization files from ~/.emacs.d/lisp
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'zeyuan-display)
(require 'zeyuan-elpa)
(require 'zeyuan-mac)
(require 'zeyuan-perl)
(require 'zeyuan-cpp)

;; Enable use-package
(eval-when-compile
  (require 'use-package))

; Start emacs ido mode on default
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

; activation org mode
; Ref: http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

; use graphviz-dot-mode
(add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode))


; Enable default Wind Move keybindings
; (i.e. S-right move point to the right window to the current frame)
; note: this disable shift selection
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

; Enable the 80 column rule
(load "fill-column-indicator") ;; best not to include the ending ".el" or ".elc"
(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")
;; Enable this minor mode globally
;; (https://www.emacswiki.org/emacs/FillColumnIndicator#toc5)
(define-globalized-minor-mode my-global-fci-mode fci-mode
    (lambda () (fci-mode 1)))
(my-global-fci-mode 1)
;set 43 to be mobile-friendly code browsing
(setq fci-rule-column 80) 

; Auto show completions for execute-extended-command
(icomplete-mode 1)

; Keep a list of recently opened files
(recentf-mode 1)

; Highlights the matching pair when the point is over parentheses
(show-paren-mode 1)

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
 '(delete-selection-mode nil)
 '(package-selected-packages
   (quote
    (use-package flycheck auto-complete-c-headers yasnippet-classic-snippets yasnippet-snippets yasnippet dumb-jump projectile ggtags rust-mode neotree markdown-mode graphviz-dot-mode go-mode cl-generic auto-complete)))
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


;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
          '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
                    (kill-buffer buffer)))))

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

;;------------------------------------
;; Key bindings
;;------------------------------------

(global-set-key (kbd "C-x C-b") 'ibuffer) ; replace "list-buffers" with "ibuffer"
(global-set-key (kbd "<f8>") 'execute-extended-command) ; bind with 'M-x' by default
(global-set-key (kbd "<f7>") 'neotree-toggle)
;(global-set-key "\C-m" 'newline-and-indent) ; make Emacs auto-indent my C code 
(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)
(global-set-key (kbd "<f4>") 'undo)
;; (global-set-key (kbd "<f5>") 'yank)
;; (global-set-key (kbd "<f6>") 'kill-region)
(global-set-key (kbd "<f5>") 'dumb-jump-go)
(global-set-key (kbd "<f6>") 'dumb-jump-back)

;;------------------------------------
;; Make frequently used commands short
;;------------------------------------

(defalias 'lml 'list-matching-lines)
(defalias 'gl 'goto-line)
(defalias 'rs 'replace-string)
(defalias 'qrr 'query-replace-regexp)
(defalias 'qr 'query-replace)
(defalias 'list-buffers 'ibuffer) ; always use ibuffer
(defalias 'yes-or-no-p 'y-or-n-p) ; y or n is enough
(defalias 'rb 'revert-buffer)
(defalias 'rof 'recentf-open-files) ; list recently opened files
(defalias 'cy 'clipboard-yank); copy the text from clipboard
(defalias 'ck 'clipboard-kill-region); copy the text to clipboard
(defalias 'cr 'comment-region);
(defalias 'ucr 'uncomment-region);

;;----------------------------------
;; Global modes setting
;;----------------------------------

; Please uncomment the following block if you want to turn off electric-indent-mode globally
;(when (fboundp 'electric-indent-mode) 
;   (electric-indent-mode -1))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(provide 'init)
;;; init.el ends here
