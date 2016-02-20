;;;------------------------------------
;;; Tested on Emacs 23
;;;------------------------------------


;;------------------------------------
;; Emacs System
;;------------------------------------

; load package.el for emacs version lower than 24
(when (< emacs-major-version 24)
    (load
      (expand-file-name "~/.emacs.d/package.el")
    )
)
(require 'package) ; import package
(add-to-list 'package-archives
              '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
   ;; For important compatibility libraries like cl-lib
   (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ; initialize package


; use color-theme package (http://www.nongnu.org/color-theme/)
(add-to-list 'load-path "~/.emacs.d/color-theme.el")
(require 'color-theme)
(eval-after-load "color-theme"
   '(progn
            (color-theme-initialize)
                 (color-theme-hober)))

; Start emacs ido mode on default
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

; auto show completions for execute-extended-command
(icomplete-mode 1)

; disable Emacs welcome screen
(setq inhibit-startup-message t)

; enable "Which function mode". It will show you which function cursor is in
(which-function-mode 1)

;;------------------------------------
;; Key bindings
;;------------------------------------

(global-set-key (kbd "C-x C-b") 'ibuffer) ; replace "list-buffers" with "ibuffer"
(global-set-key (kbd "<f8>") 'execute-extended-command) ; bind with 'M-x' by default
(global-set-key "\C-m" 'newline-and-indent) ; make Emacs auto-indent my C code 
(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)
(global-set-key (kbd "<f4>") 'undo)
(global-set-key (kbd "<f5>") 'yank)
(global-set-key (kbd "<f6>") 'kill-region)


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




