(require 'saveplace)

(require-package 'rainbow-delimiters)
(require-package 'helm)

;; When you visit a file, point goes to the last place where it
;; was when you previously visited the same file.
;; http://www.emacswiki.org/emacs/SavePlace

(setq-default save-place t)
;; keep track of saved places in ~/.emacs.d/places
(setq save-place-file (concat user-emacs-directory "places"))

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

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

;; No need for ~ files when editing
(setq create-lockfiles nil)


(require 'helm-config)
(helm-mode 1)

(provide 'zeyuan-others)
