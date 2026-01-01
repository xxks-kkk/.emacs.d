;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: markdown     ;;
;;                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(custom-set-variables
 '(markdown-command "/opt/homebrew/bin/pandoc"))

(provide 'emacs.markdown)
