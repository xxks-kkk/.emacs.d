; AUCTeX: LaTeX editing, compilation and PDF viewing
; Note: AUCTeX's major mode is LaTeX-mode (not the built-in latex-mode), so
; hooks must be TeX-mode-hook / LaTeX-mode-hook; tex-mode-hook no longer runs.

(use-package tex
  :ensure auctex
  :init
  (setq TeX-auto-save t                     ; parse the document on save
        TeX-parse-self t                    ; parse the document on load
        TeX-PDF-mode t
        TeX-source-correlate-mode t         ; SyncTeX: C-c C-v jumps to the PDF spot
        TeX-source-correlate-start-server t
        reftex-plug-into-AUCTeX t)          ; \ref and \cite completion through RefTeX
  (setq-default TeX-master nil)             ; multi-file documents: ask for the master file

  ; Paragraph readability.  font-latex raises super/subscripts with a `raise'
  ; display spec, which makes any line carrying one taller than its neighbours;
  ; scattered through a paragraph that reads as loose, uneven spacing that is
  ; hard to tell apart from the blank line between paragraphs.  Turn it off, then
  ; add back a small, *uniform* line-spacing so lines breathe evenly while the
  ; blank-line paragraph gap still stands out.  line-spacing is buffer-local, so
  ; set it from the hook to keep it scoped to TeX buffers.
  (setq font-latex-fontify-script nil)

  ; Skim as the PDF viewer.  AUCTeX's builtin "Skim" entry only runs `open -a',
  ; which loses the position, so call Skim's displayline helper by full path
  ; instead: -r reloads the PDF if it is already open, -b draws the highlight
  ; bar at the target line.  (Add -g to keep focus in Emacs instead of raising
  ; Skim.)  Backward search is the Skim side: Preferences -> Sync -> PDF-TeX
  ; Sync support -> Preset: Emacs.
  (setq TeX-view-program-list
        '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -r -b %n %o %b")))
  (setq TeX-view-program-selection
        '((output-dvi "open") (output-pdf "Skim") (output-html "open")))

  ; org-like section folding: TAB cycles the section at point, S-TAB the whole
  ; buffer.  outline-minor-mode-cycle binds them only on heading lines, so TAB
  ; still indents (and expands snippets) everywhere else.
  (setq outline-minor-mode-cycle t
        outline-minor-mode-highlight 'append)

  :hook ((TeX-mode . outline-minor-mode)
         (TeX-mode . reftex-mode)
         (TeX-mode . (lambda () (setq line-spacing 0.15)))    ; relaxed intra-line gap; tune to taste

         ; Keep \ref completion in sync with hand-typed labels.  The in-buffer
         ; dropdown serves RefTeX's cached document scan, and a \label{...}
         ; typed by hand (rather than inserted with C-c () stays out of that
         ; cache until a rescan -- saving alone does not trigger one.  Rescan
         ; just the saved file on each save so new labels complete right away.
         ; Buffer-local hook (last arg t) keeps this out of non-TeX buffers.
         (reftex-mode . (lambda ()
                          (add-hook 'after-save-hook #'reftex-parse-one nil t)))))

;;; ------------------------------------------------------------------
;;; AUCTeX cheat sheet (all keys verified against auctex 14.1.2)
;;; ------------------------------------------------------------------
;;
;; COMPILE AND VIEW
;;   C-c C-c   run the next sensible command (LaTeX, then BibTeX, then View)
;;   C-c C-a   run everything: compile, re-compile as needed, then view
;;   C-c C-v   forward search: show this spot in Skim (SyncTeX)
;;   C-c `     go to the next error       (C-c C-l shows the compilation log)
;;   C-c C-k   kill a running compilation
;;   Backward search: shift-cmd-click in Skim jumps to that line in Emacs.
;;   It needs Skim's Preferences -> Sync -> Preset set to Emacs, and an Emacs
;;   server, which TeX-source-correlate-start-server starts automatically.
;;
;; SECTION FOLDING (outline-minor-mode, org-like)
;;   TAB       on a \section/\subsection line: cycle that subtree
;;   S-TAB     cycle the whole buffer: overview -> all headings -> everything
;;   C-c @ C-t hide all bodies          C-c @ C-a  show everything
;;
;; NAVIGATE
;;   C-c =     RefTeX table of contents; navigate the document from it
;;   C-c ^     switch to the master file
;;   C-c *     mark the current section   C-c .  mark the current environment
;;
;; CROSS-REFERENCES AND CITATIONS (RefTeX)
;;   C-c (     insert a \label
;;   C-c )     insert a \ref, choosing the target from a list
;;   C-c [     insert a \cite, searching your .bib files
;;   C-c &     show what the \ref or \cite under point points at
;;
;; INSERT
;;   C-c C-e   insert an environment (or change the one point is in)
;;   C-c ]     close the innermost open environment
;;   C-c C-s   insert a section, asking for level, title and label
;;   M-RET     insert \item (also C-c C-j)
;;   C-c RET   insert a macro, with completion and argument prompts
;;   C-c C-f   font prefix: C-c C-f C-e \emph, C-c C-f C-b \textbf,
;;             C-c C-f C-i \textit, C-c C-f C-t \texttt
;;   C-c %     comment/uncomment the paragraph
;;
;; MATH
;;   C-c ~     toggle LaTeX-math-mode; then a backquote is a math prefix:
;;             ` a -> \alpha,  ` b -> \beta,  ` = -> \equiv, and so on
;;   C-c C-p C-p    preview: render the equation/environment at point as an
;;                  image, in place in the buffer (this is preview-latex;
;;                  it needs ghostscript, already installed at
;;                  /opt/homebrew/bin/gs)
;;   C-c C-p C-b    preview the whole buffer     C-c C-p C-r  the region
;;   C-c C-p C-d    preview the whole document
;;   C-c C-p C-c C-p  clear the preview at point (back to editable source)
;;   C-c C-p C-c C-b  clear all previews in the buffer
;;   A previewed image turns back into source as soon as point enters it.
;;
;; FOLD MACROS (different from section folding: hides \cite{...} as [c], etc.)
;;   C-c C-o C-f   toggle TeX-fold-mode; then:
;;   C-c C-o C-b   fold the buffer        C-c C-o b     unfold the buffer
;;   C-c C-o C-o   fold/unfold the item at point
;;
;; FILL
;;   C-c C-q C-p   fill the paragraph, respecting LaTeX syntax
;;   C-c C-q C-e   fill the environment
;;
;; MULTI-FILE DOCUMENTS
;;   C-c _     set the master file for this buffer
;;   C-c C-n   re-parse the file after adding packages or \input files

(provide 'emacs.latex)
