(require 'auto-complete)
(global-auto-complete-mode t)
(defun auto-complete-mode-maybe ()
 (auto-complete-mode 1))
(require 'auto-complete-config)
(ac-config-default)

; let's define a function which intializes auto-complete-c-headers and gets
; called for c/c++ hooks
(defun my:ac-c-headers-init ()
(require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (setq achead:include-directories
   (append '("/usr/include/c++/7"
             "/usr/include/x86_64-linux-gnu/c++/7"
             "/usr/include/c++/7/backward"
             "/usr/lib/gcc/x86_64-linux-gnu/7/include"
             "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed"
             "/usr/include/x86_64-linux-gnu")
             achead:include-directories)))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

(provide 'emacs.auto.complete)
