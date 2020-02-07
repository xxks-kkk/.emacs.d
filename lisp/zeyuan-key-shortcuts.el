;;------------------------------------
;; Key bindings
;;------------------------------------

; replace "list-buffers" with "ibuffer"
; (global-set-key (kbd "C-x C-b") 'ibuffer) 
;(global-set-key (kbd "<f8>") 'execute-extended-command) ; bind with 'M-x' by default
;(global-set-key "\C-m" 'newline-and-indent) ; make Emacs auto-indent my C code 
(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)
; This is best used in combination with .projectile (including the ignored directories) to
; grep only specific directories/files
(global-set-key (kbd "<f2>") 'helm-projectile-grep)
(global-set-key (kbd "<f4>") 'undo)
;; (global-set-key (kbd "<f5>") 'yank)
;; (global-set-key (kbd "<f6>") 'kill-region)
;(global-set-key (kbd "<f5>") 'dumb-jump-go)
;(global-set-key (kbd "<f6>") 'dumb-jump-back)
;; try to provide file name completion (e.g., completion in CMakeLists.txt)
(global-set-key (kbd "<f9>") 'comint-dynamic-complete-filename)
;; quickly open files using projectiles (similar to CMD+P in VS code)
(global-set-key (kbd "<f8>") 'projectile-find-file-dwim)
(global-set-key (kbd "<f10>") 'projectile--find-file)
(global-set-key (kbd "S-<f10>") 'menu-bar-open)
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
(defalias 'hgd 'helm-gtags-dwim); find the function usage under the cursor

;;------------------------------------
;; Make frequently used commands short
;;------------------------------------

; use C-u C-s will search for other occurrences of the symbol at point
(defun endless/isearch-symbol-with-prefix (p)
  "Like isearch, unless prefix argument is provided.
With a prefix argument P, isearch for the symbol at point."
  (interactive "P")
  (let ((current-prefix-arg nil))
    (call-interactively
     (if p #'isearch-forward-symbol-at-point
       #'isearch-forward))))
(global-set-key [remap isearch-forward]
                #'endless/isearch-symbol-with-prefix)


(provide 'zeyuan-key-shortcuts)
