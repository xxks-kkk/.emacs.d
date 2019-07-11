;; Load my personal customization files from ~/.emacs.d/lisp
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; setup package repo
(require 'emacs.elpa)

; install necessary packages
(require 'emacs.packages)

; set custom-file
(setq custom-file "~/.emacs.d/.emacs-custom.el")
(require 'f)
(when (f-exists? (concat user-emacs-directory ".emacs-custom.el")) 
  (load custom-file))

; load configurations
(require 'emacs.fill.column.indicator)
(require 'emacs.golden.ratio)
(require 'emacs.theme)
(require 'emacs.ui)
(require 'emacs.auto.complete)
(require 'emacs.yasnippet)
(require 'emacs.dumb.jump)
(require 'setup-helm)
(require 'emacs.company)
(require 'emacs.neotree)
(require 'zeyuan-mac)
(require 'emacs.flycheck)
(require 'zeyuan-perl)
(require 'zeyuan-cpp)
(require 'zeyuan-go)
(require 'emacs.clang.format)
(require 'zeyuan-key-shortcuts)
(require 'emacs.undo.tree)
(require 'setup-helm-gtags)
(require 'emacs.rainbow.delimiters)
(require 'emacs.modes)
(require 'zeyuan-others)
(require 'zeyuan-rust)
(require 'emacs.highlight.symbol)
(require 'emacs.helm.descbinds)
(require 'emacs.command.log.mode)
(require 'emacs.markdown)
(require 'emacs.format.all)

(provide 'init)
;;; init.el ends here
