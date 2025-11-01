; activation org mode
; Ref: http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

; use yaml-mode
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

; Auto show completions for execute-extended-command
(icomplete-mode 1)

; Deactive tabs to be used for indentation (force myself to use space for indentation)
(setq-default indent-tabs-mode nil)

; Make whitespace-mode use just basic coloring
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))

; Keep a list of recently opened files
(recentf-mode 1)
(setq recentf-max-menu-items 40)

; Start emacs ido mode on default
(setq ido-enable-flex-matching t)
;(setq ido-everywhere t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length -1)
;(setq ido-use-virtual-buffers t)
(ido-mode 1)


(provide 'emacs.modes)
