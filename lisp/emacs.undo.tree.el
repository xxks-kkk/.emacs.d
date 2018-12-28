;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package: undo-tree                  ;;
;;                                     ;;
;; GROUP: Editing -> Undo -> Undo Tree ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package undo-tree
  :ensure t
  :init
  ;;turn on everywhere
  (global-undo-tree-mode 1)
  :bind (
      ;; main entry key
      ([f3] . 'undo-tree-redo)
  ))

(provide 'emacs.undo.tree)
