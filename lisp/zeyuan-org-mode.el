(require 'org)
(define-key org-mode-map "\C-cl" 'org-store-link)
(define-key org-mode-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(provide 'zeyuan-org-mode)
