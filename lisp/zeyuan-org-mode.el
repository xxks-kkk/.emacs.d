(require 'org)
(require 'ox-publish)
(require 'ox-bibtex)
(require 'org-tempo) ;https://emacs.stackexchange.com/questions/40571/how-to-set-a-short-cut-for-begin-src-end-src/40587
(require 'org-ref)

(add-hook 'org-mode-hook #'iimage-mode)

(define-key org-mode-map "\C-cl" 'org-store-link)
(define-key org-mode-map "\C-ca" 'org-agenda)

(setq org-log-done t)
(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "~/org/"
         :base-extension "org"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4           ; just the default for this project.
         :auto-preamble t
         )
        ("org-static"
         :base-directory "~/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org"
         :components ("org-notes" "org-static"))
        ))

; org-ref configuration
(setq org-ref-bibliography-notes "~/org/ref/notes.org"
      org-ref-default-bibliography '("~/org/ref/master.bib")
      org-ref-pdf-directory "~/org/ref/pdfs/")

(provide 'zeyuan-org-mode)
