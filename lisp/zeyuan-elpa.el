;;; Emacs packages config

;; [EAB] Add and enable MELPA                                                   
(setq package-archives                                                          
      '(                                                                        
        ("melpa" . "http://melpa.org/packages/")                                
        ;;("melpa-stable" . "http://stable.melpa.org/packages/")                
        ;; ("org"       . "http://orgmode.org/elpa/")                           
        ("gnu"       . "http://elpa.gnu.org/packages/")                         
        ("marmalade" .  "https://marmalade-repo.org/packages/"))                
      )                                                                         
                                                                                
(package-initialize)                                                            
(package-refresh-contents)                                                      
                                                                    
(defun packages-require (&rest packs)                                           
  "Install and load a package. If the package is not available install it automaticaly."
  (mapc  (lambda (package)                                                      
           (unless (package-installed-p package)                                
             (package-install package)                                          
             ))                                                                 
         packs                                                                  
         ))                                                                     

(defun require-package (package)
  "Install given PACKAGE if it was not installed before."
  (if (package-installed-p package)
      t
    (progn
      (unless (assoc package package-archive-contents)
        (package-refresh-contents))
      (package-install package))))

(provide 'zeyuan-elpa)
