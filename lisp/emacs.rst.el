; reStructuredText: org-like section folding in rst-mode.
;
; rst.el understands section adornments but never connects them to
; outline-minor-mode, and an rst heading cannot be expressed as an
; outline-regexp: the level is decided by the adornment line *below* the title,
; and which character means which level is per-document, fixed by the order the
; adornments first appear.  Emacs 29 added `outline-search-function' for exactly
; this kind of heading, so all that is needed is a search function plus a level
; function.
;
; The title line is the heading line, so a folded section shows just its title,
; like a folded org headline.  (Keeping the underline visible as well is
; tempting, but `outline-heading-end-regexp' cannot do it: outline-cycle
; decides the current fold state by checking whether the hidden region starts
; on a heading line, and an underline is not one.)

(require 'outline)

(defconst rst-outline--adornment-re "\\(\\([[:punct:]]\\)\\2+\\)[ \t]*$"
  "Match a section adornment line: two or more copies of one punctuation char.")

(defun rst-outline--adornment ()
  "Return (CHAR . LENGTH) if the current line is an adornment line, else nil."
  (save-excursion
    (forward-line 0)
    (when (looking-at rst-outline--adornment-re)
      (cons (char-after (match-beginning 2))
            (- (match-end 1) (match-beginning 1))))))

(defun rst-outline--title-key ()
  "Return the adornment key of the section title on the current line.
The key is a string identifying the adornment style, for example \"u-\" for
a title underlined with dashes and \"o=\" for one over- and underlined with
equal signs.  Return nil when the current line does not start a section."
  (save-excursion
    (save-match-data
      (forward-line 0)
      (let ((text (string-trim (buffer-substring-no-properties
                                (point) (line-end-position)))))
        (and (not (string-empty-p text))
             (not (rst-outline--adornment))
             (let ((over (save-excursion (forward-line -1)
                                         (rst-outline--adornment)))
                   (under (save-excursion (forward-line 1)
                                          (rst-outline--adornment))))
               ; docutils requires the underline to be at least as long as the
               ; title; requiring it too keeps stray punctuation lines out.
               (and under
                    (>= (cdr under) (length text))
                    (format "%s%c"
                            (if (and over (eq (car over) (car under))) "o" "u")
                            (car under)))))))))

(defvar-local rst-outline--keys-cache nil
  "Cons of the buffer tick and the adornment keys in order of first use.")

(defun rst-outline--scan-keys ()
  "Adornment keys of the buffer, in the order they first appear."
  (save-excursion
    (save-match-data
      (goto-char (point-min))
      (let (keys)
        (while (re-search-forward (concat "^" rst-outline--adornment-re) nil t)
          (forward-line 0)
          (let ((key (save-excursion (forward-line -1) (rst-outline--title-key))))
            (when (and key (not (member key keys)))
              (push key keys)))
          (forward-line 1))
        (nreverse keys)))))

(defun rst-outline--keys ()
  "Adornment keys of the buffer, recomputed only after an edit."
  (let ((tick (buffer-chars-modified-tick)))
    (unless (eq (car rst-outline--keys-cache) tick)
      (setq rst-outline--keys-cache (cons tick (rst-outline--scan-keys))))
    (cdr rst-outline--keys-cache)))

(defun rst-outline-level ()
  "Nesting level of the section title at point."
  (save-excursion
    (let ((key (rst-outline--title-key)))
      (if key
          (1+ (or (seq-position (rst-outline--keys) key #'equal) 0))
        1000))))                        ; not a heading: sorts below everything

(defun rst-outline-search (&optional bound move backward looking-at)
  "Search for an rst section title.  See `outline-search-function'."
  (if looking-at
      (and (bolp) (rst-outline--title-key)
           (looking-at ".*"))           ; match the whole title line
    (let ((origin (point))
          found)
      (save-excursion
        ; A heading starting exactly at point counts going forward, but not
        ; going backward -- the same asymmetry re-search-{forward,backward} have.
        (if backward
            (forward-line (if (bolp) -1 0))
          (unless (bolp) (forward-line 1)))
        (while (and (not found)
                    (if backward (not (bobp)) (not (eobp)))
                    (if bound
                        (if backward (>= (point) bound) (<= (point) bound))
                      t))
          (if (rst-outline--title-key)
              (setq found (point))
            (forward-line (if backward -1 1)))))
      (cond (found (goto-char found)
                   (looking-at ".*")
                   ; leave point where re-search-{forward,backward} would
                   (goto-char (if backward (match-beginning 0) (match-end 0)))
                   t)
            (move (goto-char (if backward (point-min) (point-max))) nil)
            (t (goto-char origin) nil)))))

(defun rst-outline-setup ()
  "Turn on outline-minor-mode with rst section titles as headings."
  (setq-local outline-search-function #'rst-outline-search
              outline-level #'rst-outline-level)
  (outline-minor-mode 1))

; org-like cycling: TAB on a title line cycles that section, S-TAB the whole
; buffer.  Both are bound only on heading lines, so TAB still indents elsewhere.
(setq outline-minor-mode-cycle t
      outline-minor-mode-highlight 'append)

(add-hook 'rst-mode-hook #'rst-outline-setup)

;;; ------------------------------------------------------------------
;;; rst section folding cheat sheet
;;; ------------------------------------------------------------------
;;
;;   TAB       on a title line: cycle that subtree (hidden -> children -> all)
;;   S-TAB     cycle the whole buffer: overview -> all headings -> everything
;;   C-c @ C-t hide all bodies            C-c @ C-a  show everything
;;   C-c @ C-d hide the subtree at point  C-c @ C-s  show it
;;   C-c @ C-n / C-c @ C-p   next / previous visible heading
;;   C-c @ C-u move to the parent heading
;;
;; rst-mode's own section commands still apply:
;;   C-c C-a C-d  show the adornment hierarchy of this document
;;   C-c C-t C-t  insert a table of contents   C-c C-t C-u  update it
;;   C-= / C--    make the section at point one level deeper / shallower
;;   C-M-a / C-M-e  move to the start / end of the section

(provide 'emacs.rst)
