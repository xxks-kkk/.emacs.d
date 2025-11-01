(use-package graphviz-dot-mode
  :defer t
  :mode "\\.dot\\'"
  :config
  (setq graphviz-dot-indent-width 4)
  :hook
  (graphviz-dot-mode . flycheck-mode))

(provide 'emacs.graphviz)