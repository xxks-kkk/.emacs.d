;;; Emacs MacOS-specific Config

(setenv "PATH" (concat ".:/usr/local/bin" (getenv "PATH")))
(add-to-list 'exec-path "/usr/local/bin/")

;; Mac specific setup
(cond
 ((string-equal system-type "darwin") ; mac OSX
  ;; We want to emacs able to find 'gdb' under $HOME/bin (i.e. /Users/zeyuan/bin)
  ;; the 'gdb' under 'bin' is a symbolic soft link to the 'ggdb', which is gdb installed via macports
  (setenv "PATH" "/Users/zeyuan/bin:$PATH" t)
  (add-to-list 'exec-path "/Users/zeyuan/bin")
  ))

;; set keys for Apple keyboard, for emacs in OS X
(setq mac-command-modifier 'meta) ; make cmd key do Meta
(setq mac-option-modifier 'super) ; make opt key do Super
(setq mac-control-modifier 'control) ; make Control key do Control
(setq ns-function-modifier 'hyper)  ; make Fn key do Hyper

(provide 'zeyuan-mac)
