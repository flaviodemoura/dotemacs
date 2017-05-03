(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   (quote
    (("LatexMk" "latexmk -pdflatex='pdflatex -file-line-error --shell-escape -interaction=nonstopmode -synctex=1' %(-PDF)%S%(mode) %t" TeX-run-latexmk nil
      (plain-tex-mode latex-mode doctex-mode)
      :help "Run LatexMk")
     ("TeX" "%(PDF)%(tex) %(file-line-error) %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %(extraopts) %`%S%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t t :help "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil t :help "Convert DVI file to PostScript")
     ("Ps2pdf" "ps2pdf %f" TeX-run-ps2pdf nil t :help "Convert PostScript file to PDF")
     ("Index" "makeindex %s" TeX-run-index nil t :help "Run makeindex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(bbdb-complete-mail t)
 '(bbdb-mail-user-agent (quote gnus-user-agent))
 '(column-number-mode t)
 '(coq-prog-args (quote ("-emacs")))
 '(doc-view-continuous t)
 '(gnus-summary-line-format "%U%R%z%I%(%[%4L: %-23,23f%]%) %s
")
 '(gnus-use-frames-on-any-display t)
 '(gnus-use-full-window nil)
 '(message-mode-hook
   (quote
    ((lambda nil
       (cond
	((string-match "INBOX" gnus-newsgroup-name)
	 (setGmail))
	(t
	 (setUnB))))
     orgstruct++-mode
     (lambda nil
       (setq fill-column 72)
       (flyspell-mode 1))
     turn-on-auto-fill bbdb-mail-aliases)))
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.doc\\'" . default)
     ("\\.docx\\'" . default)
     ("\\.djvu\\'" . default)
     ("\\.jpg\\'" . default)
     ("\\.jpeg\\'" . default)
     ("\\.png\\'" . default)
     ("\\.pdf\\'" . "open -a Skim %s"))))
 '(org-html-inline-images t)
 '(org-latex-pdf-process
   (quote
    ("pdflatex -interaction nonstopmode -output-directory %o %f" "bibtex %b" "pdflatex -interaction nonstopmode -output-directory %o %f" "pdflatex -interaction nonstopmode -output-directory %o %f")))
 '(org-latex-to-pdf-process
   (quote
    ("pdflatex -interaction nonstopmode -output-directory %o %f" "bibtex %b" "pdflatex -interaction nonstopmode -output-directory %o %f" "pdflatex -interaction nonstopmode -output-directory %o %f")) t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-gnus org-info org-irc org-mhe org-rmail org-w3m)))
 '(org-reveal-mathjax t)
 '(package-selected-packages
   (quote
    (htmlize ox-reveal org-present epresent org-gcal org-ref company-auctex bbdb-handy org-bullets org-edit-latex org-mobile-sync magit fill-column-indicator flycheck dash-functional org-pomodoro persp-mode bbdb bbdb-ext helm-dictionary osx-dictionary auctex calfw calfw-gcal org-eww cdlatex direx dired-k orgit writeroom-mode magit-stgit look-mode key-chord hydra)))
 '(pop-up-windows nil)
 '(proof-assistants (quote (coq pgocaml)))
 '(proof-auto-raise-buffers t)
 '(proof-delete-empty-windows nil)
 '(proof-disappearing-proofs t)
 '(proof-electric-terminator-enable t)
 '(proof-splash-enable nil)
 '(proof-three-window-enable t)
 '(proof-three-window-mode-policy (quote hybrid))
 '(safe-local-variable-values
   (quote
    ((coq-prog-name . "/Users/flaviomoura/.opam/4.01.0/bin/coqtop")
     (org-export-allow-bind-keywords . t))))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(smtpmail-smtp-server "mail.unb.br")
 '(smtpmail-smtp-service 587)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil t)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))) t)
 '(vc-annotate-very-old-color nil t)
 '(writeroom-width 119))


;; (setq org-latex-pdf-process (quote ("texi2dvi --pdf --clean --verbose --batch %f" "bibtex %b" "texi2dvi --pdf --clean --verbose --batch %f" "texi2dvi --pdf --clean --verbose --batch %f")))

;;(setq org-latex-to-pdf-process (list "latexmk -pdf -bibtex %f"))

;;(set-default-font "Courier 12")
;;(add-to-list 'default-frame-alist '(font . "PragmataPro 13"))
;;(set-default-font "-apple-inconsolata-medium-r-normal--13-130-72-72-m-130-iso10646-1")
;;(set-face-font 'default "-jmk-neep alt-medium-r-*-*-13-*-*-*-c-*-iso8859-1")
;;(set-face-font 'default "-misc-fixed-medium-r-normal--11-*-*-*-c-100-iso8859-1")
;;(set-face-font 'default "-ncd-terminal-medium-r-normal-*-13-180-*-*-*-*-*-*")
;;(set-face-font 'default "-*-Avenir-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1")
;;(set-face-font 'default "-*-Avenir-normal-normal-normal-*-14-*-*-*-c-100-iso8859-1")

(global-font-lock-mode 1)                     ; for all buffers
(setq display-time-day-and-date t)

(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;;(electric-pair-mode 1)
(show-paren-mode 1)
(setq show-paren-style 'expression)

(defun unwrap-line ()
      "Remove all newlines until we get to two consecutive ones.
    Or until we reach the end of the buffer.
    Great for unwrapping quotes before sending them on IRC."
      (interactive)
      (let ((start (point))
            (end (copy-marker (or (search-forward "\n\n" nil t)
                                  (point-max))))
            (fill-column (point-max)))
        (fill-region start end)
        (goto-char end)
        (newline)
        (goto-char start)))

;; (setq 	  message-send-mail-function	'smtpmail-send-it
;; 	  smtpmail-smtp-server		"mail.unb.br"
;; 	  smtpmail-smtp-service 587)

;; melpa
;; (add-to-list 'package-archives
;;               '("melpa" . "http://melpa.milkbox.net/packages/") t)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)


;;(setq user-emacs-directory "~/Dropbox/.emacs.d")
;;(add-to-list 'load-path (expand-file-name "~/Dropbox/.emacs.d/extra/"))
;;(add-to-list 'custom-theme-load-path "~/Dropbox/.emacs.d/themes/")


(require 'helm-config)
(require 'helm)

;; hol4
;; (autoload 'hol "/Users/flaviomoura/hol/tools/hol-mode"
;;      "Runs a HOL session in a comint window.
;;    With a numeric prefix argument, runs it niced to that level
;;    or at level 10 with a bare prefix. " t)

;; do not open new window
(setq ns-pop-up-frames nil)


;;(set-face-attribute 'font-lock-comment-face nil :foreground "lime green")
;; ; default window width and height
;; (defun custom-set-frame-size ()
;;   (add-to-list 'default-frame-alist '(height . 65))
;;   (add-to-list 'default-frame-alist '(width . 99)))
;; (custom-set-frame-size)
;; (add-hook 'before-make-frame-hook 'custom-set-frame-size)

(setq ns-use-srgb-colorspace t)

(setq scroll-step 1)

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".org" ".tex" ".pdf"))
;; (setq ido-auto-merge-work-directories-length -1)

(setq org-hide-emphasis-markers t)
;; *negrito*
;; /itálico/
;; _sublinhado_
;; =código=
;; ~verbatim~

;;caml
;;(load "/usr/local/share/emacs/site-lisp/tuareg.el")
(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
;;coq
(setq auto-mode-alist (cons '("\\.v$" . coq-mode) auto-mode-alist))
(autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)
;;(add-hook 'coq-mode-hook #'company-coq-initialize)
;; proof general
;;(load-file "/usr/local/share/emacs/site-lisp/proof-general/generic/proof-site.el")
;;(load-file "/usr/local/ProofGeneral/generic/proof-site.el")
(load "~/.emacs.d/lisp/PG/generic/proof-site")

(eval-after-load "proof-script" '(progn
				   (define-key proof-mode-map [(C-down)] 
				     'proof-assert-next-command-interactive)
				   (define-key proof-mode-map [(C-up)] 
				     'proof-undo-last-successful-command)
				   ))

(add-hook 'proof-goals-mode-hook 
   (lambda () (setq proof-eagerly-raise nil)))
 (add-hook 'proof-response-mode-hook 
   (lambda () (setq proof-eagerly-raise nil)))
;;(setq proof-tree-external-display t)

;;(require 'psvn)

(setq ispell-dictionary "pt_BR")
;;flyspell
(setq-default ispell-program-name "/usr/local/bin/aspell")
(setq ispell-list-command "--list")
(add-hook 'org-mode-hook 'turn-on-flyspell)

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(autoload 'flyspell-delay-command "flyspell" "Delay on command." t) 
(autoload 'tex-mode-flyspell-verify "flyspell" "" t) 

;; (require 'auto-dictionary)
;; (add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))

;; (defun flyspell-emacs-popup-textual (event poss word)
;;       "A textual flyspell popup menu."
;;       (require 'popup)
;;       (let* ((corrects (if flyspell-sort-corrections
;;                            (sort (car (cdr (cdr poss))) 'string<)
;;                          (car (cdr (cdr poss)))))
;;              (cor-menu (if (consp corrects)
;;                            (mapcar (lambda (correct)
;;                                      (list correct correct))
;;                                    corrects)
;;                          '()))
;;              (affix (car (cdr (cdr (cdr poss)))))
;;              show-affix-info
;;              (base-menu  (let ((save (if (and (consp affix) show-affix-info)
;;                                          (list
;;                                           (list (concat "Save affix: " (car affix))
;;                                                 'save)
;;                                           '("Accept (session)" session)
;;                                           '("Accept (buffer)" buffer))
;;                                        '(("Save word" save)
;;                                          ("Accept (session)" session)
;;                                          ("Accept (buffer)" buffer)))))
;;                            (if (consp cor-menu)
;;                                (append cor-menu (cons "" save))
;;                              save)))
;;              (menu (mapcar
;;                     (lambda (arg) (if (consp arg) (car arg) arg))
;;                     base-menu)))
;;         (cadr (assoc (popup-menu* menu :scroll-bar t) base-menu))))

;; (eval-after-load "flyspell"
;;       '(progn
;;          (fset 'flyspell-emacs-popup 'flyspell-emacs-popup-textual)))

;; bbdb
;;(require 'gmail2bbdb)
;;(autoload 'gmail2bbdb-import-file "gmail2bbdb")
;;(setq gmail2bbdb-bbdb-file "~/Dropbox/bbdb")
;; file where things will be saved
(setq bbdb-file "~/Dropbox/bbdb")
;; load bbdb
(require 'bbdb-loaddefs)
(require 'bbdb)
(bbdb-initialize 'gnus 'message)
(bbdb-mua-auto-update-init 'gnus 'message)
(setq bbdb-pop-up-window-size 10)
(setq bbdb-mua-update-interactive-p '(query . create))
(setq bbdb-message-all-addresses t)
(add-hook
 'gnus-summary-mode-hook
 (lambda ()
   (define-key gnus-summary-mode-map (kbd ";") 'bbdb-mua-edit-field)
   ))
;;(add-hook 'message-setup-hook 'bbdb-mail-aliases)

;;(add-hook 'mail-setup-hook 'bbdb-define-all-aliases)
;;(add-hook 'message-setup-hook 'bbdb-define-all-aliases)

;;calendar
(setq calendar-week-start-day 1)

(setq calendar-intermonth-text
      '(propertize
        (format "%2d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'font-lock-warning-face))

(setq calendar-intermonth-header
      (propertize "Wk"                  ; or e.g. "KW" in Germany
                  'font-lock-face 'font-lock-keyword-face))

;; diary
(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

(setq org-agenda-include-diary t)
(setq org-agenda-inhibit-startup nil)
(setq org-catch-invisible-edits t)
;;(require 'org-mac-iCal)
(add-hook 'org-agenda-cleanup-fancy-diary-hook
	  (lambda ()
	    (goto-char (point-min))
	    (save-excursion
	      (while (re-search-forward "^[a-z]" nil t)
		(goto-char (match-beginning 0))
		(insert "0:00-24:00 ")))
	    (while (re-search-forward "^ [a-z]" nil t)
	      (goto-char (match-beginning 0))
	      (save-excursion
		(re-search-backward "^[0-9]+:[0-9]+-[0-9]+:[0-9]+ " nil t))
	      (insert (match-string 0)))))

;; Org
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-directory "~/Dropbox/MyOrg")
(setq org-agenda-files (quote ("~/Dropbox/MyOrg"
			       "~/Dropbox/MyOrg/homepage"
			       "~/workspace-git/lc1/2017-1"
			       "~/workspace-git/ftc/2017-1"
			       "~/workspace-git/bookalcs"
			       "~/workspace-git/lex"
			       "~/workspace-git/lsfa2017"
			       "~/workspace-git//vfp")))
(setq org-mobile-inbox-for-pull "~/Dropbox/MyOrg/index.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-todo-keywords
      '((type "TODO(t)" "PROGRESS(s)" "NEXT(x)" "WAITING(w)" "|" "CANCELLED(c)" "DEFERRED(e)" "DONE(d)")
	(sequence "PROJECT(p)" "|" "FINISHED(f)")
	(sequence "INVOICE(i)" "SENT(n)" "|" "RCVD(r)")))
(setq message-mode-hook
      (quote (orgstruct++-mode
              (lambda nil (setq fill-column 72) (flyspell-mode 1))
              turn-on-auto-fill
              bbdb-mail-aliases))) 
(setq org-agenda-custom-commands
      '(("d" "Upcoming deadlines" agenda "" 
                ((org-agenda-time-grid nil)
                 (org-deadline-warning-days 365)        
                 (org-agenda-entry-types '(:deadline))  
                 ))
	("n" "Agenda + Next Actions" ((agenda) (todo "NEXT")))
	("I" "Import diary from iCal" agenda ""
         ((org-agenda-mode-hook
           (lambda ()
             (org-mac-iCal)))))
	))
(setq org-return-follows-link t)

(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

;; homepage
;; (require 'ox-publish)
;; (setq org-publish-project-alist
;;       '(
;; 	("homepage-dropbox"
;; 	 :base-directory "~/Dropbox/MyOrg/homepage/"
;; 	 :base-extension "org"
;; 	 :publishing-directory "~/public_html/"
;; 	 :recursive t
;; 	 :publishing-function org-html-publish-to-html
;; 	 :headline-levels 4
;; 	 :auto-preamble t
;; 	 )
;; 	("homepage-lc1"
;; 	 :base-directory "~/workspace/aulas/lc1/org/"
;; 	 :base-extension "org"
;; 	 :publishing-directory "~/workspace/aulas/lc1/org/"
;; 	 :recursive t
;; 	 :publishing-function org-html-publish-to-html
;; 	 :headline-levels 4
;; 	 :auto-preamble t
;; 	 )
;; 	("homepage-staticlc1"
;; 	 :base-directory "~/workspace/aulas/lc1/pvs"
;; 	 :base-extension "v"
;; 	 :publishing-directory "~/workspace/aulas/lc1/files/lc1/"
;; 	 :recursive t
;; 	 :publishing-function org-publish-attachment
;; 	 )
;; 	("homepage-vfp"
;; 	 :base-directory "~/workspace/aulas/vfp/org/"
;; 	 :base-extension "org"
;; 	 :publishing-directory "~/workspace/aulas/vfp/org/"
;; 	 :recursive t
;; 	 :publishing-function org-html-publish-to-html
;; 	 :headline-levels 4
;; 	 :auto-preamble t
;; 	 )
;; 	("homepage-staticvfp"
;; 	 :base-directory "~/workspace/aulas/vfp/coq"
;; 	 :base-extension "v"
;; 	 :publishing-directory "~/workspace/aulas/vfp/org/files/vfp/"
;; 	 :recursive t
;; 	 :publishing-function org-publish-attachment
;; 	 )
;; 	("homepage-static"
;; 	 :base-directory "~/Dropbox/MyOrg/homepage/files/vfp"
;; 	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
;; 	 :publishing-directory "~/public_html/files/vfp/"
;; 	 :recursive t
;; 	 :publishing-function org-publish-attachment
;; 	 )
;; 	("homepagelc1" :components ("homepage-lc1" "homepage-staticlc1"))
;; 	("homepagevfp" :components ("homepage-vfp" "homepage-staticvfp"))
;; 	))
;; (setq org-html-validation-link nil)

(add-hook 'org-mode-hook (lambda () 
  (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link)))

(setq org-default-notes-file (concat org-directory "/ongoing/notes.org"))

;; org and Coq
;;(require 'ob-coq)
;;(require 'org-id)
;; (require 'org-contacts)
;; (add-to-list 'org-capture-templates
;; 	     '("c" "Contacts" entry (file "~/Dropbox/MyOrg/ongoing/contacts.org")
;; 	       "* %(org-contacts-template-name)
;; :PROPERTIES:
;; :EMAIL: %(org-contacts-template-email)
;; :PHONE:
;; :ALIAS:
;; :NICKNAME:
;; :IGNORE:
;; :ICON:
;; :NOTE:
;; :ADDRESS:
;; :BIRTHDAY:
;; :END:"))

;;org-ref
(setq org-ref-bibliography-notes "~/workspace-git/bibliography/notes.org"
     org-ref-default-bibliography '("~/workspace-git/bibliography/references.bib")
     org-ref-pdf-directory "~/workspace-git/bibliography/bibtex-pdfs/") 

(add-to-list 'load-path "~/Dropbox/MyOrg/org-ref/")
(require 'org-ref)
(require 'doi-utils)
(require 'jmax-bibtex)
(require 'pubmed)
(require 'arxiv)
(require 'sci-id)
(require 'scopus)
(require 'bibtex)
(require 'isbn)

(require 'calfw-org)

;; (setq oref-ref-insert-cite-key "C-c )")
;; (setq org-ref-default-citation-link "cite")

;; *** helm-bibtex

(setq helm-bibtex-bibliography "~/Dropbox/bibliography/references.bib")
(setq helm-bibtex-library-path "~/Dropbox/bibliography/bibtex-pdfs")

;; open pdf with system pdf viewer (works on mac)
(setq helm-bibtex-pdf-open-function
  (lambda (fpath)
    (start-process "open" "*open*" "open" fpath)))

;; alternative
;; (setq helm-bibtex-pdf-open-function 'org-open-file)

(setq helm-bibtex-notes-path "~/Dropbox/bibliography/")
(setq helm-bibtex-notes-extension ".org")

;; Make emacs aware of multi-file projects
(setq-default TeX-master nil)

(setq TeX-PDF-mode t)

(require 'reftex)
;; Auctex
;;(require 'tex-site)
;;(require 'auctex-latexmk)
;;(auctex-latexmk-setup)
;;(setq auctex-latexmk-inherit-TeX-PDF-mode t)
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq reftex-default-bibliography '("~/Dropbox/bibliography/references.bib"))


(add-hook 'LaTeX-mode-hook (lambda ()
			     (push
			      '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
				:help "Run latexmk on file")
			      TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))


; by Stéphane Gimenez
;; (set-foreground-color "grey85")
;;(set-background-color "green")
(set-cursor-color "Black")
;;(add-to-list 'default-frame-alist '(cursor-color . "palegoldenrod"))

(column-number-mode t)

;;(setq tramp-default-method "ssh")
(setq tramp-default-method "ftp")


(setq TeX-view-program-selection '((output-dvi "xdvi")
				   (output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "/usr/local/bin/displayline -b %n %o %b")))

(setq exec-path (append exec-path '("/Library/TeX/texbin"))) 
(setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t)
;;(getenv "PATH")
;;(setenv "PATH" (concat "/usr/local/bin:/Library/TeX/texbin" ":" (getenv "PATH")))

;; ;; font size
;; (set-face-attribute 'default nil :height 120)
;; ;; change size font on the fly
;; (defun increase-font-size ()
;;   (interactive)
;;   (set-face-attribute 'default
;;                       nil
;;                       :height
;;                       (ceiling (* 1.10
;;                                   (face-attribute 'default :height)))))
;; (defun decrease-font-size ()
;;   (interactive)
;;   (set-face-attribute 'default
;;                       nil
;;                       :height
;;                       (floor (* 0.9
;;                                   (face-attribute 'default :height)))))
;; (global-set-key (kbd "C-+") 'increase-font-size)
;; (global-set-key (kbd "C--") 'decrease-font-size)

;; (custom-set-faces
;;  ;; view docs
;; (fset 'doc-prev "\C-xo\C-x[\C-xo")
;; (fset 'doc-next "\C-xo\C-x]\C-xo")
;; (global-set-key (kbd "M-[") 'doc-prev)
;; (global-set-key (kbd "M-]") 'doc-next)
;; ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

(add-hook 'org-mode-hook
	  '(lambda ()
	     (setq org-file-apps
		   '((auto-mode . emacs)
		     ("\\.doc\\'" . default)
		     ("\\.docx\\'" . default)
		     ("\\.djvu\\'" . default)
		     ("\\.pdf\\'" . default)))))

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

;(setq synonyms-file "/usr/local/mthesaur.txt")
;(setq synonyms-cache-file "/usr/local/mthesaurcache.txt")
;(require 'synonyms)


;; gnus
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(setq gnus-registry-max-entries 2500)
(gnus-registry-initialize)
;;(gnorb-tracking-initialize)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;;twitter
;;(require 'twittering-mode)
;;(setq twittering-use-master-password t)

;; Add opam emacs directory to the load-path
(setq opam-share (substring (shell-command-to-string "opam config var
   share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; Load merlin-mode
;;(require 'merlin)
;; Start merlin on ocaml files
;;(add-hook 'tuareg-mode-hook 'merlin-mode t)
;;(add-hook 'caml-mode-hook 'merlin-mode t)
;; Enable auto-complete
;;(setq merlin-use-auto-complete-mode 'easy)
;; Use opam switch to lookup ocamlmerlin binary
;;(setq merlin-command 'opam)

;;(require 'arxiv-mode)

;;(load-theme 'calmer-forest)
;;(load-theme 'solarized-dark)
;;(load-theme 'ahungry)
;;(load-theme 'sanityinc-solarized-light)
;;(load-theme 'tsdh-light)
;;(load-theme 'tango-dark t) 
;;(load-theme 'lawrence t) 
;; (require 'color-theme)
;; (color-theme-initialize)
;;(load-file "~/.emacs.d/themes/inkpot-theme.el")
;;(load-theme 'inkpot)
;;(load-theme 'zenburn)
;; (load-file "~/.emacs.d/themes/color-theme-almost-monokai.el")
;; (color-theme-almost-monokai)
;; ;; (color-theme-robin-hood)
;; ;; (color-theme-gnome)
;; (color-theme-gnome2)
;; ;; (color-theme-matrix)
;; ;; (color-theme-aalto-light)
;;(load-file "~/.emacs.d/themes/prez-theme.el")
;;(load-theme 'prez)

(global-hl-line-mode 1)
;;(require 'color)
;;(set-face-background 'hl-line (color-darken-name (face-background 'default) 10))
;;(set-face-foreground 'highlight nil)
;;(set-face-attribute 'default nil :background "gray15")
;;(set-face-attribute 'hl-line nil :foreground nil :background "gray5")



;;org-present
(autoload 'org-present "org-present" nil t)
(autoload 'hide-mode-line "hide-mode-line" nil t)

;;(tool-bar-mode -1)

;;(setq browse-url-browser-function 'eww-browse-url)

(global-set-key [f12] 'org-ref-open-in-browser)
(global-set-key [f11] 'org-ref-open-bibtex-pdf)
(global-set-key [f10] 'previous-buffer)
(global-set-key [f9] 'other-window)
(global-set-key [f8] 'next-buffer)
(global-set-key [f7] 'kill-this-buffer)
(global-set-key [f6] 'flyspell-buffer)
(global-set-key [f5] 'ispell-change-dictionary)
(global-set-key [f4] 'flyspell-mode)
(global-set-key [f3] 'writeroom-mode)
(global-set-key [f2] 'gnus)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c d") 'osx-dictionary-search-pointer)
(global-set-key (kbd "C-c e") 'org-html-export-to-html)
(global-set-key (kbd "C-c f") 'cfw:open-org-calendar)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c p") 'org-latex-export-to-pdf)
(global-set-key (kbd "C-c x") 'org-latex-export-to-latex)
(global-set-key (kbd "C-c s") 'bbdb-search-name)
(global-set-key (kbd "C-c u") 'org-publish-project)
(global-set-key "\C-cm" 'org-mac-message-insert-selected)
(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "M-q") 'unwrap-line)
(global-set-key (kbd "C-x g") 'magit-status)
;;disable docview
;;(rassq-delete-all #'doc-view-mode auto-mode-alist)

(server-start)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
