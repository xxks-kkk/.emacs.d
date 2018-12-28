(packages-require 'paredit)                                                     
(packages-require 'rainbow-delimiters)                                          
(packages-require 'cl)                                                          
(packages-require 'ggtags)                                                      
(packages-require 'use-package)                                                 
(packages-require 'fill-column-indicator)
(packages-require 'golden-ratio)
(packages-require 'color-theme-sanityinc-solarized)
(packages-require 'color-theme-sanityinc-tomorrow)
(packages-require 'helm)
(packages-require 'helm-swoop)
(packages-require 'helm-projectile)
(require-package 'company)
(packages-require 'projectile)
(packages-require 'clang-format)
(packages-require 'f)
(packages-require 'cmake-mode)

;; Enable use-package
(eval-when-compile
  (require 'use-package))

(provide 'emacs.packages)
