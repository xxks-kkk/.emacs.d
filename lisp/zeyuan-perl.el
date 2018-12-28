;;----------------------------------
;; Perl
;;----------------------------------
;; 
(setq perl-indent-level 2)

; turn off auto indentation (electric-indent-mode) for perl
(defun perl-mode-disable-auto-indent()
 (electric-indent-mode -1))
(add-hook 'perl-mode-hook 'perl-mode-disable-auto-indent)
(put 'dired-find-alternate-file 'disabled nil)

(provide 'zeyuan-perl)
