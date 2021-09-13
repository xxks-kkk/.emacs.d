(require 'org)
(require 'ox-publish)
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
         ("coursera-programming-languages-inherit"
         :base-directory "~/org/"
         :recursive t
         :base-extension "css\\|js"
         :publishing-directory "~/public_html/cousera-programming-languages/"
         :publishing-function org-publish-attachment
         )
         ("coursera-programming-languages-notes"
          :base-directory "~/projects/Code-for-blog/2020/coursera-programming-languages/notes/"
          :auto-index t
          :index-filename "sitemap.org"
          :index-title "Sitemap"
          :recursive t
          :base-extension "org"
          :publishing-directory "~/public_html/cousera-programming-languages/"
          :publishing-function org-html-publish-to-html
          :headline-levels 3
          )
         ("coursera-programming-languages-static"
          :base-directory "~/projects/Code-for-blog/2020/coursera-programming-languages/notes/"
          :recursive t
          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
          :publishing-directory "~/public_html/coursera-programming-languages/"
          :publishing-function org-publish-attachment)
         ("coursera-programming-languages"
          :components ("coursera-programming-languages-inherit"
                       "coursera-programming-languages-notes"
                       "coursera-programming-languages-static"))
        )
      )

; org-ref configuration
(setq org-ref-bibliography-notes "~/org/ref/notes.org"
      org-ref-default-bibliography '("~/org/ref/master.bib")
      org-ref-pdf-directory "~/org/ref/pdfs/")

(provide 'zeyuan-org-mode)
