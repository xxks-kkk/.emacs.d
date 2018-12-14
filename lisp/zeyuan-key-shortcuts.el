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

(defun toggle-comment-on-line ()
  "Comment or uncomment current line."
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Helm-related key configurations
(with-eval-after-load "helm"
    (bind-key "M-Y" #'helm-execute-persistent-action helm-map))
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(define-key global-map [remap execute-extended-command] 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(define-key global-map (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

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
(defalias 'eb 'eval-buffer)

(provide 'zeyuan-key-shortcuts)
