(use-package wrap-region
    :ensure t
    :config
    (wrap-region-global-mode t)
    (wrap-region-add-wrapper "~" "~" nil 'org-mode)  ; code
    (wrap-region-add-wrapper "*" "*" nil 'org-mode)  ; bold
    (wrap-region-add-wrapper "/" "/" nil 'org-mode)  ; italic
    (wrap-region-add-wrapper "+" "+" nil 'org-mode)  ; strikethrough
    (wrap-region-add-wrapper "=" "=" nil 'org-mode)) ; verbatim

(provide 'emacs.wrap.region.mode)
