;;; Emacs packages config

; Load package.el for emacs version lower than 24
(when (< emacs-major-version 24)
    (load
      (expand-file-name "~/.emacs.d/package.el")
    )
)
(require 'package) ; import package
(add-to-list 'package-archives
              '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
   ; For important compatibility libraries like cl-lib
   (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ; initialize package

(provide 'zeyuan-elpa)
