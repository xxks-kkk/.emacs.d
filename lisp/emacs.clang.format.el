;;;;;;;;;;;;;;;;;;;;;;;;
;; setup clang-format ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(require 'f)
(require 'clang-format)
(defun clang-format-buffer-smart ()
  "Reformat buffer if .clang-format exists in the projectile root. Otherwise, use Mozilla style by default"
  (if (f-exists? (expand-file-name ".clang-format" (projectile-project-root)))
      (progn (setq clang-format-style-option "file")
       (clang-format-buffer)
       )
    (progn (setq clang-format-style-option "Mozilla")
     (clang-format-buffer)
)))
(defun clang-format-on-save ()
  (add-hook 'before-save-hook #'clang-format-buffer-smart nil t))
(add-hook 'c++-mode-hook 'clang-format-on-save)
(add-hook 'c-mode-hook 'clang-format-on-save)

(provide 'emacs.clang.format)
