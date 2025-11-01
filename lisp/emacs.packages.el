(packages-require 'auto-complete
                  'cl-lib
                  'clang-format
                  'cmake-mode
                  'command-log-mode
                  'company
                  'modus-themes
                  'dumb-jump
                  'f
                  'flycheck
                  'flycheck-rust
                  'fill-column-indicator
                  'ggtags
                  'golden-ratio
                  'helm
                  'helm-descbinds
                  'helm-gtags
                  'helm-projectile
                  'highlight-symbol
                  'markdown-mode
                  'paredit
                  'projectile
                  'racer
                  'rust-mode
                  'rainbow-delimiters
                  'undo-tree
                  'use-package
                  'yasnippet
                  'yasnippet-snippets
                  'auto-complete-c-headers
                  'flycheck-pycheckers
                  'format-all
                  'go-mode
                  'go-guru
                  'yaml-mode
                  'flycheck-yamllint
                  'web-mode
                  'haml-mode
                  'wrap-region
                  ;;'org-plus-contrib
                  ;;'org-ref
                  'exec-path-from-shell
                  'ess
                  'fic-mode
                  'jinja2-mode
                  'htmlize
                  'sass-mode
                  'scss-mode
                  'dtrt-indent
                  'graphviz-dot-mode
                  'sml-mode)

;; Enable use-package
(eval-when-compile
  (require 'use-package))

(provide 'emacs.packages)
