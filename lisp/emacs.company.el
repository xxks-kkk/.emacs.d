;; Company is an auto-completion tool that can use various backends to retrieve possible completions
;; It's significantly better maintained than auto-complete, which is one of the main alternatives

;; Emacs puts ispell-completion-at-point in the capf list of text-mode and
;; everything derived from it (LaTeX-mode included), so idle completion in prose
;; would fire a dictionary lookup on nearly every word.  Emacs 30 lets us drop
;; that capf and keep the real backends (AUCTeX macros, RefTeX, dabbrev).
(setq text-mode-ispell-word-completion nil)

(use-package company
  :ensure t
  :demand t
  :init
  ;; On everywhere, minus the modes whose own input handling company fights
  ;; with.  Note this list is matched against major-mode exactly: it does not
  ;; follow mode derivation, so derived modes must be named individually.
  (setq company-global-modes '(not comint-mode eshell-mode gud-mode))
  (setq company-tooltip-align-annotations t)

  ;; Keep the case of buffer words.  company-dabbrev downcases every candidate
  ;; by default (company-dabbrev-downcase is `case-replace', i.e. t) and then
  ;; leaves the typed prefix untouched (`keep-prefix'), so completing \Depth
  ;; against \DepthCap in the buffer yields \Depthcap.  Identifiers and LaTeX
  ;; macros are case-sensitive, so take candidates verbatim and match on case.
  (setq company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil)
  :config
  (global-company-mode 1))

(provide 'emacs.company)
