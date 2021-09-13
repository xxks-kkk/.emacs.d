(use-package cypher-mode
  :ensure t
  :config
    (when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
  )

(provide 'zeyuan-cypher)
