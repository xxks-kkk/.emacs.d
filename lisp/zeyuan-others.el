;; Contains various emacs tweaks
;; all the tweaks should NOT include tweaks to the 3rd-party packages; all
;; features are shipped with emacs by default

(require 'saveplace)

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

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Enable auto-fill-mode
(add-hook 'text-mode-hook 'auto-fill-mode)

(provide 'zeyuan-others)
