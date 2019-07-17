;use makefile-mode
(add-to-list 'auto-mode-alist '("\\Makefile.vm\\'" . makefile-mode))

;This sets the buffer-local variable show-trailing-whitespace,
;only for Makefiles (including Makefile.am and Makefile.in)
(add-hook 'makefile-mode-hook
          (lambda()
            (setq show-trailing-whitespace t)))

(provide 'zeyuan-makefile)
