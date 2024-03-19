;; (require 'package)
;; (setq package-enable-at-startup nil)

;; (setq package-archives '(("melpa" . "https://melpa.org/packages/")
;; 			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
;;                          ("elpa" . "https://elpa.gnu.org/packages/")))

;; (package-initialize)

;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (unless (package-installed-p 'quelpa)
;;   (with-temp-buffer
;;     (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
;;     (eval-buffer)
;;     (quelpa-self-upgrade)))

;; (quelpa
;;  '(quelpa-use-package
;;    :fetcher git
;;    :url "https://github.com/quelpa/quelpa-use-package.git"))
;; (require 'quelpa-use-package)


;; (org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(setq warning-minimum-level :error)

(straight-use-package 'org)

(setq user-full-name "Flávio L. C. de Moura")
(setq user-mail-address "flavio.de.moura@gmail.com")

(global-set-key (kbd "M-=") 'text-scale-increase)
(global-set-key (kbd "M--") 'text-scale-decrease)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode 1)
(global-visual-line-mode 1)

(setq ring-bell-function 'ignore)

(show-paren-mode 1)

(use-package proof-general
  :straight t
  :config
  (eval-after-load "proof-script" '(progn
                                     (define-key proof-mode-map [(C-down)] 
						 'proof-assert-next-command-interactive)
                                     (define-key proof-mode-map [(C-up)] 
						 'proof-undo-last-successful-command))))
(setq pg-hide-all-proofs t)
(setq proof-electric-terminator-enable t)
(setq proof-three-window-mode-policy 'hybrid)

(use-package company :straight t)
(use-package company-coq :straight t)


(use-package ivy
    :straight t
    :config
    (ivy-mode 1))
  (use-package ivy-bibtex
    :straight t)

(use-package org-ref
  :straight t
  :after (org)
  :config
  (require 'org-ref)
  (define-key org-mode-map (kbd "C-c ]") 'org-ref-insert-link))

(setq bibtex-completion-bibliography '("~/workspace/org/zotLib.bib")
	bibtex-completion-library-path '("~/Dropbox/pdfs/")
	bibtex-completion-notes-path "~/Dropbox/pdf-notes/"
	bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"

	bibtex-completion-additional-search-fields '(keywords)
	bibtex-completion-display-formats
	'((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
	  (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
	  (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	  (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	  (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
	bibtex-completion-pdf-open-function
	(lambda (fpath)
	  (call-process "open" nil 0 nil fpath)))

(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
	"bibtex %b"
	"pdflatex -interaction nonstopmode -output-directory %o %f"
	"pdflatex -interaction nonstopmode -output-directory %o %f"))

(use-package ace-window
   :straight t
   :init
   (global-set-key [remap other-window] 'ace-window))

;; (use-package magit
;;   :straight t
;;   :bind ("C-x g" . magit-status)
;;   :config
;;   (setq magit-repository-directories '(("~/.emacs.d" . 0)
;;                                        ("~/workspace/" . 2))))

;; (use-package forge
;;   :straight t)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-repository-directories '(("~./emacs.d" . 0)
				       ("~/workspace/" . 2))))

(use-package forge
  :ensure t)

(use-package zotxt
  :ensure t)
(setq org-zotxt-mode t)

(use-package orgit
  :ensure t)

(use-package orgtbl-aggregate
  :ensure t)

(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t)
(setq global-copilot-mode t)
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

(use-package tex
  :straight auctex
  :config
  (setq TeX-PDF-mode t)
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil))
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "okular --unique %o#src:%n%b")))

(setq org-latex-listings t)
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("entcs"
                 "\\documentclass[9pt]{entcs}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
  (add-to-list 'org-latex-classes
               '("myarticle"
                 "\\documentclass[9pt]{article}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
  (add-to-list 'org-latex-classes
               '("myreport"
                 "\\documentclass[11pt]{report}"
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

(defun zp/org-find-time-file-property (property &optional anywhere)
  "Return the position of the time file PROPERTY if it exists.
        When ANYWHERE is non-nil, search beyond the preamble."
  (save-excursion
    (goto-char (point-min))
    (let ((first-heading
           (save-excursion
             (re-search-forward org-outline-regexp-bol nil t))))
      (when (re-search-forward (format "^#\\+%s:" property)
                               (if anywhere nil first-heading)
                               t)
        (point)))))

(defun zp/org-has-time-file-property-p (property &optional anywhere)
  "Return the position of time file PROPERTY if it is defined.
        As a special case, return -1 if the time file PROPERTY exists but
        is not defined."
  (when-let ((pos (zp/org-find-time-file-property property anywhere)))
    (save-excursion
      (goto-char pos)
      (if (and (looking-at-p " ")
               (progn (forward-char)
                      (org-at-timestamp-p 'lax)))
          pos -1))))

(defun zp/org-set-time-file-property (property &optional anywhere pos)
  "Set the time file PROPERTY in the preamble.
        When ANYWHERE is non-nil, search beyond the preamble.
        If the position of the file PROPERTY has already been computed,
        it can be passed in POS."
  (when-let ((pos (or pos
                      (zp/org-find-time-file-property property))))
    (save-excursion
      (goto-char pos)
      (if (looking-at-p " ")
          (forward-char)
        (insert " "))
      (delete-region (point) (line-end-position))
      (let* ((now (format-time-string "[%Y-%m-%d %a %H:%M]")))
        (insert now)))))

(defun zp/org-set-last-modified ()
  "Update the LAST_MODIFIED file property in the preamble."
  (when (derived-mode-p 'org-mode)
    (zp/org-set-time-file-property "LAST_MODIFIED")))

(add-hook 'before-save-hook #'zp/org-set-last-modified)

(setq org-file-apps '((auto-mode . emacs)
                      ("\\.mm\\'" . default)
                      ("\\.x?html?\\'" . system)
                      ("\\.dvi\\'" . system)
                      ("\\.pdf\\'" . "/usr/bin/okular %s")))
(setq org-startup-indented 'f)
(setq org-startup-folded t)
(setq org-return-follows-link  t)
(setq org-directory "~/workspace/org/")
(setq org-special-ctrl-a/e 't)
(setq org-default-notes-file (concat org-directory "notes.org"))
(setq org-src-fontify-natively 't)
(setq org-src-tab-acts-natively t)
(setq org-src-window-setup 'current-window)
(setq org-deadline-warning-days 90)
(setq org-agenda-files (directory-files-recursively "~/workspace/org" "\\.org$"))
(setq org-agenda-show-all-dates t)
(setq org-agenda-start-with-log-mode t)
(setq org-agenda-start-with-clockreport-mode t)
(setq org-agenda-arquives-mode t)
(setq org-agenda-dim-blocked-tasks nil)
(setq org-agenda-inhibit-startup t)
(setq org-agenda-use-tag-inheritance nil)
(setq org-agenda-ignore-properties '(effort appt stats category))
(setq org-todo-keywords
      '((type "TODO(t)" "PROGRESS(s@/!)" "WAITING(w@/!)" "READING(r)" "NEXT(n)" "|" "CANCELLED(c)" "DONE(d)" "READ(e)")))

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c l") 'org-store-link)

(require 'ox-publish)
(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" href=\"files/mystyle3.css\" />")
(setq org-publish-project-alist
      '(("lc1"
         :base-directory "~/workspace/LC1-github"
         :base-extension "org"
         :publishing-directory "~/workspace/flaviodemoura.github.io/public/"
         :publishing-function org-html-publish-to-html
         :headline-levels 3
         :section-numbers nil
         :with-toc nil
         :html-head "<link rel="stylesheet" type="text/css" href="files/site.css"/>"
         :html-preamble t)
	
        ("paa"
         :base-directory "~/workspace/PAA-github"
         :base-extension "org"
         :publishing-directory "~/workspace/flaviodemoura.github.io/public/"
         :publishing-function org-html-publish-to-html
         :headline-levels 3
         :section-numbers nil
         :with-toc nil
         :html-head "<link rel="stylesheet" type="text/css" href="files/site.css"/>"
         :html-preamble t)
	
        ("webpage"
         :recursive t
         :base-directory "~/workspace/flaviodemoura.github.io/content/"
         :publishing-directory "~/workspace/flaviodemoura.github.io/public/"
         :publishing-function 'org-html-publish-to-html
         :with-author nil
         :with-creator nil
         :with-toc nil
         :section-numbers nil
         :time-stamp-file nil)
	
        ("images"
         :base-directory "~/workspace/org/jpeg/"
         :base-extension "jpg\\|gif\\|png"
         :publishing-directory "~/workspace/flaviodemoura.github.io/public/files"
         :publishing-function org-publish-attachment)
	
        ("ensino" :components ("webpage" "lc1" "paa" ))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("/home/flaviomoura/workspace/org/journal/20180101.org" "/home/flaviomoura/workspace/org/journal/20180102.org" "/home/flaviomoura/workspace/org/journal/20180104.org" "/home/flaviomoura/workspace/org/journal/20180105.org" "/home/flaviomoura/workspace/org/journal/20180106.org" "/home/flaviomoura/workspace/org/journal/20180111.org" "/home/flaviomoura/workspace/org/journal/20180112.org" "/home/flaviomoura/workspace/org/journal/20180114.org" "/home/flaviomoura/workspace/org/journal/20180129.org" "/home/flaviomoura/workspace/org/journal/20180207.org" "/home/flaviomoura/workspace/org/journal/20180208.org" "/home/flaviomoura/workspace/org/journal/20180322.org" "/home/flaviomoura/workspace/org/journal/20180425.org" "/home/flaviomoura/workspace/org/journal/20180511.org" "/home/flaviomoura/workspace/org/journal/20180522.org" "/home/flaviomoura/workspace/org/journal/20180523.org" "/home/flaviomoura/workspace/org/journal/20180622.org" "/home/flaviomoura/workspace/org/journal/20181009.org" "/home/flaviomoura/workspace/org/journal/20181030.org" "/home/flaviomoura/workspace/org/journal/20181101.org" "/home/flaviomoura/workspace/org/journal/20181109.org" "/home/flaviomoura/workspace/org/journal/20181111.org" "/home/flaviomoura/workspace/org/journal/20181113.org" "/home/flaviomoura/workspace/org/journal/20181114.org" "/home/flaviomoura/workspace/org/journal/20181116.org" "/home/flaviomoura/workspace/org/journal/20181120.org" "/home/flaviomoura/workspace/org/journal/20181123.org" "/home/flaviomoura/workspace/org/journal/20181127.org" "/home/flaviomoura/workspace/org/journal/20181130.org" "/home/flaviomoura/workspace/org/journal/20181201.org" "/home/flaviomoura/workspace/org/journal/20190321.org" "/home/flaviomoura/workspace/org/journal/20190528.org" "/home/flaviomoura/workspace/org/journal/20190920.org" "/home/flaviomoura/workspace/org/journal/20190921.org" "/home/flaviomoura/workspace/org/journal/20190922.org" "/home/flaviomoura/workspace/org/journal/20190923.org" "/home/flaviomoura/workspace/org/journal/20190924.org" "/home/flaviomoura/workspace/org/journal/20190925.org" "/home/flaviomoura/workspace/org/journal/20191107.org" "/home/flaviomoura/workspace/org/journal/2020-06-13.org" "/home/flaviomoura/workspace/org/journal/2022-09-09.org" "/home/flaviomoura/workspace/org/journal/2022-09-10.org" "/home/flaviomoura/workspace/org/journal/2022-09-11.org" "/home/flaviomoura/workspace/org/journal/2022-09-12.org" "/home/flaviomoura/workspace/org/journal/2022-09-13.org" "/home/flaviomoura/workspace/org/journal/2022-09-14.org" "/home/flaviomoura/workspace/org/journal/2022-09-15.org" "/home/flaviomoura/workspace/org/journal/2022-09-16.org" "/home/flaviomoura/workspace/org/journal/2022-09-17.org" "/home/flaviomoura/workspace/org/journal/2022-09-18.org" "/home/flaviomoura/workspace/org/journal/2022-09-19.org" "/home/flaviomoura/workspace/org/journal/2022-09-20.org" "/home/flaviomoura/workspace/org/journal/2022-09-21.org" "/home/flaviomoura/workspace/org/journal/2022-09-24.org" "/home/flaviomoura/workspace/org/journal/2022-09-25.org" "/home/flaviomoura/workspace/org/journal/2022-09-26.org" "/home/flaviomoura/workspace/org/journal/2022-09-27.org" "/home/flaviomoura/workspace/org/journal/2022-09-28.org" "/home/flaviomoura/workspace/org/journal/2022-09-29.org" "/home/flaviomoura/workspace/org/journal/2022-09-30.org" "/home/flaviomoura/workspace/org/journal/2022-12-27.org" "/home/flaviomoura/workspace/org/journal/2022-12-28.org" "/home/flaviomoura/workspace/org/journal/2023-01-09.org" "/home/flaviomoura/workspace/org/journal/2023-01-13.org" "/home/flaviomoura/workspace/org/journal/2023-01-26.org" "/home/flaviomoura/workspace/org/journal/2023-03-23.org" "/home/flaviomoura/workspace/org/journal/2023-03-27.org" "/home/flaviomoura/workspace/org/journal/2023-03-28.org" "/home/flaviomoura/workspace/org/web/ensino.org" "/home/flaviomoura/workspace/org/web/index.org" "/home/flaviomoura/workspace/org/web/pdf-from-coq.org" "/home/flaviomoura/workspace/org/web/publications.org" "/home/flaviomoura/workspace/org/2019-1prova1PAAgabarito.org" "/home/flaviomoura/workspace/org/2019-1prova2PAA.org" "/home/flaviomoura/workspace/org/2019-1prova3PAA.org" "/home/flaviomoura/workspace/org/2019-2projetoPAA.org" "/home/flaviomoura/workspace/org/2019-2prova1PAA.org" "/home/flaviomoura/workspace/org/2019-2prova1PAAgabarito.org" "/home/flaviomoura/workspace/org/2019-2prova2PAA.org" "/home/flaviomoura/workspace/org/2019-2prova2PAAgabarito.org" "/home/flaviomoura/workspace/org/2019Abr dietaDengo.org" "/home/flaviomoura/workspace/org/2019Abr planodeTrabalhoGabriel.org" "/home/flaviomoura/workspace/org/2019Abr planodetrabalhoFelipe.org" "/home/flaviomoura/workspace/org/2019Abr projetopibicLeandro.org" "/home/flaviomoura/workspace/org/2019Abr reviewITP2019.org" "/home/flaviomoura/workspace/org/2019Abr tereseA1-A3.org" "/home/flaviomoura/workspace/org/2019Abr tg1-gabriel-taumaturgo.org" "/home/flaviomoura/workspace/org/2019Abr tg1-gerson-antunes.org" "/home/flaviomoura/workspace/org/2019Abr trancamentoMichelMelo.org" "/home/flaviomoura/workspace/org/2019AbrMichelMelo.org" "/home/flaviomoura/workspace/org/2019Abr_Zprop.org" "/home/flaviomoura/workspace/org/2019Abr_Zprop.orgGitHub.org" "/home/flaviomoura/workspace/org/20200610145704-hn_learningcomplextechnicalinformation.org" "/home/flaviomoura/workspace/org/20200610151116-procap.org" "/home/flaviomoura/workspace/org/20200610151457-moodle.org" "/home/flaviomoura/workspace/org/20200610151524-ead.org" "/home/flaviomoura/workspace/org/20200911175914-coq.org" "/home/flaviomoura/workspace/org/20201222165433-configuracoes.org" "/home/flaviomoura/workspace/org/20201227103248-dengosusy.org" "/home/flaviomoura/workspace/org/20210106155638-paa_2020_2 2.org" "/home/flaviomoura/workspace/org/20210114171956-xiii_workshop_de_verao_do_mat.org" "/home/flaviomoura/workspace/org/AMAI-D-20-00236.org" "/home/flaviomoura/workspace/org/MSCS-2021-012R1_Proof_hi.org" "/home/flaviomoura/workspace/org/MSCS-2021-012R2_Proof_hi.org" "/home/flaviomoura/workspace/org/MSCS-2021-012_Proof_hi.org" "/home/flaviomoura/workspace/org/MSNorm.org" "/home/flaviomoura/workspace/org/abel19_failur_normal_impred_type_theor.org" "/home/flaviomoura/workspace/org/abelfailurenormalizationimpredicative2020.org" "/home/flaviomoura/workspace/org/adm-unb-parecerCADE2019.org" "/home/flaviomoura/workspace/org/adm-unb-proposta-ccar2020-1.org" "/home/flaviomoura/workspace/org/adm-unb-proposta-graduacao.org" "/home/flaviomoura/workspace/org/agenda.org" "/home/flaviomoura/workspace/org/alcs.org" "/home/flaviomoura/workspace/org/alugar-ou-comprar-carro.org" "/home/flaviomoura/workspace/org/autobiografia_infancia.org" "/home/flaviomoura/workspace/org/ayala_rinconappliedlogiccomputer2017.org" "/home/flaviomoura/workspace/org/belle20_symbol_logic_meets_machin_learn.org" "/home/flaviomoura/workspace/org/bruijn72:_lambd_churc_rosser.org" "/home/flaviomoura/workspace/org/cardapio.org" "/home/flaviomoura/workspace/org/colegiado-cic-pauta2020.org" "/home/flaviomoura/workspace/org/colegiado-cic-relatorio2019Set.org" "/home/flaviomoura/workspace/org/compositionalZ.org" "/home/flaviomoura/workspace/org/consulta.org" "/home/flaviomoura/workspace/org/coq.org" "/home/flaviomoura/workspace/org/coquand20_loren_proof_consis_elemen_number.org" "/home/flaviomoura/workspace/org/cv.org" "/home/flaviomoura/workspace/org/diary.org" "/home/flaviomoura/workspace/org/drabent19_correc_n_queen_progr.org" "/home/flaviomoura/workspace/org/du2020mechanized.org" "/home/flaviomoura/workspace/org/ebook-v2.org" "/home/flaviomoura/workspace/org/ebook-v3.org" "/home/flaviomoura/workspace/org/ebook-v4.org" "/home/flaviomoura/workspace/org/ebook-v5.org" "/home/flaviomoura/workspace/org/ebook-vol2.org" "/home/flaviomoura/workspace/org/ebook.org" "/home/flaviomoura/workspace/org/ensino.org" "/home/flaviomoura/workspace/org/entrada.org" "/home/flaviomoura/workspace/org/escrita.org" "/home/flaviomoura/workspace/org/escrita_para_autoconhecimento_e_desenvolvimento_pessoal.org" "/home/flaviomoura/workspace/org/extrato.org" "/home/flaviomoura/workspace/org/financas.org" "/home/flaviomoura/workspace/org/financas2017.org" "/home/flaviomoura/workspace/org/financasOLD.org" "/home/flaviomoura/workspace/org/flavio.org" "/home/flaviomoura/workspace/org/ftc-2016-2.org" "/home/flaviomoura/workspace/org/ftc-2017-1.org" "/home/flaviomoura/workspace/org/honestosdesonestos-1.org" "/home/flaviomoura/workspace/org/honestosdesonestos-2.org" "/home/flaviomoura/workspace/org/honestosdesonestos-3.org" "/home/flaviomoura/workspace/org/houesd.org" "/home/flaviomoura/workspace/org/hw-job.org" "/home/flaviomoura/workspace/org/ic-projeto-2019-2020.org" "/home/flaviomoura/workspace/org/iiiguideteachingpuzzlebased2014.org" "/home/flaviomoura/workspace/org/inbox.org" "/home/flaviomoura/workspace/org/index.org" "/home/flaviomoura/workspace/org/induction.org" "/home/flaviomoura/workspace/org/inicial.org" "/home/flaviomoura/workspace/org/latex-aulas-config.org" "/home/flaviomoura/workspace/org/latex-export-aulas.org" "/home/flaviomoura/workspace/org/lc1-2016-2.org" "/home/flaviomoura/workspace/org/lc1-2017-1.org" "/home/flaviomoura/workspace/org/lc1-2017-2.org" "/home/flaviomoura/workspace/org/lc1-2018-1.org" "/home/flaviomoura/workspace/org/lc1-2018-2.org" "/home/flaviomoura/workspace/org/lc1-2019-1.org" "/home/flaviomoura/workspace/org/lc1-2019-1prova2-gabarito.org" "/home/flaviomoura/workspace/org/lc1-2019-1prova2.org" "/home/flaviomoura/workspace/org/lc1-2019-2.org" "/home/flaviomoura/workspace/org/lc1-2019-2prova1-gabarito.org" "/home/flaviomoura/workspace/org/lc1-2019-2prova1.org" "/home/flaviomoura/workspace/org/lc1-2019-2prova2.org" "/home/flaviomoura/workspace/org/lc1-2020-1-ind-est-listas.org" "/home/flaviomoura/workspace/org/lc1-2020-1.org" "/home/flaviomoura/workspace/org/lc1-2020-1planodeensino.org" "/home/flaviomoura/workspace/org/lc1-2020-2-aula1.org" "/home/flaviomoura/workspace/org/lc1-2020-2-aula6.org" "/home/flaviomoura/workspace/org/lc1-2020-2-indequiv.org" "/home/flaviomoura/workspace/org/lc1-2020-2.org" "/home/flaviomoura/workspace/org/lc1-2020-2planoensino.org" "/home/flaviomoura/workspace/org/lc1-2020-2projeto-p1.org" "/home/flaviomoura/workspace/org/lc1-2020-2projeto-p2.org" "/home/flaviomoura/workspace/org/lc1-2021-1-projeto.org" "/home/flaviomoura/workspace/org/lc1-2021-1.org" "/home/flaviomoura/workspace/org/lc1-2021-1planodeensino.org" "/home/flaviomoura/workspace/org/lc1-2021-2-notas.org" "/home/flaviomoura/workspace/org/lc1-2021-2.org" "/home/flaviomoura/workspace/org/lc1-2021-2planodeensino.org" "/home/flaviomoura/workspace/org/lc1-2022-1-avisos.org" "/home/flaviomoura/workspace/org/lc1-2022-1-ca.org" "/home/flaviomoura/workspace/org/lc1-2022-1-exercicios-p1.org" "/home/flaviomoura/workspace/org/lc1-2022-1-exercicios-p2.org" "/home/flaviomoura/workspace/org/lc1-2022-1-freq.org" "/home/flaviomoura/workspace/org/lc1-2022-1-ga.org" "/home/flaviomoura/workspace/org/lc1-2022-1-notas.org" "/home/flaviomoura/workspace/org/lc1-2022-1-projeto.org" "/home/flaviomoura/workspace/org/lc1-2022-1-prova-reposicao.org" "/home/flaviomoura/workspace/org/lc1-2022-1-prova1.org" "/home/flaviomoura/workspace/org/lc1-2022-1-prova2.org" "/home/flaviomoura/workspace/org/lc1-2022-1.org" "/home/flaviomoura/workspace/org/lc1-2022-1planodeensino.org" "/home/flaviomoura/workspace/org/lc1-2022-2-projeto.org" "/home/flaviomoura/workspace/org/lc1-2022-2-prova.org" "/home/flaviomoura/workspace/org/lc1-2022-2.org" "/home/flaviomoura/workspace/org/lc1-2023-1-planodeensino.org" "/home/flaviomoura/workspace/org/lc1-2023-1-prova1.org" "/home/flaviomoura/workspace/org/lc1-2023-1-prova2.org" "/home/flaviomoura/workspace/org/lc1-2023-1.org" "/home/flaviomoura/workspace/org/lc1-2023-2-planodeensino.org" "/home/flaviomoura/workspace/org/lc1-2023-2-prova1.org" "/home/flaviomoura/workspace/org/lc1-2023-2-prova2.org" "/home/flaviomoura/workspace/org/lc1-2023-2.org" "/home/flaviomoura/workspace/org/lc1-2024-1.org" "/home/flaviomoura/workspace/org/lc1-aula01.org" "/home/flaviomoura/workspace/org/lc1-aula02.org" "/home/flaviomoura/workspace/org/lc1-aula03.org" "/home/flaviomoura/workspace/org/lc1-cs.org" "/home/flaviomoura/workspace/org/lc1-lista-gentzen.org" "/home/flaviomoura/workspace/org/lc1-notasdeaulas.org" "/home/flaviomoura/workspace/org/lc1-puzzles2019.org" "/home/flaviomoura/workspace/org/lc1.org" "/home/flaviomoura/workspace/org/lex.org" "/home/flaviomoura/workspace/org/lnr.org" "/home/flaviomoura/workspace/org/lrt.org" "/home/flaviomoura/workspace/org/lsfa2014.org" "/home/flaviomoura/workspace/org/lsfa2017.org" "/home/flaviomoura/workspace/org/martin20_pure_patter_calcul_la_de_bruij.org" "/home/flaviomoura/workspace/org/matching.org" "/home/flaviomoura/workspace/org/meulivro.org" "/home/flaviomoura/workspace/org/meuteste.org" "/home/flaviomoura/workspace/org/mollermodellingcomputingsystems2013.org" "/home/flaviomoura/workspace/org/nominal.org" "/home/flaviomoura/workspace/org/notes-backup.org" "/home/flaviomoura/workspace/org/notes.org" "/home/flaviomoura/workspace/org/ohtsukaproofsubstitutionlemma1993.org" "/home/flaviomoura/workspace/org/oostrom20.org" "/home/flaviomoura/workspace/org/oquevaleserlido.org" "/home/flaviomoura/workspace/org/org-show.org" "/home/flaviomoura/workspace/org/orgroam.org" "/home/flaviomoura/workspace/org/paa-2018-1.org" "/home/flaviomoura/workspace/org/paa-2018-2.org" "/home/flaviomoura/workspace/org/paa-2019-1.org" "/home/flaviomoura/workspace/org/paa-2019-2.org" "/home/flaviomoura/workspace/org/paa-2020-1-projeto1.org" "/home/flaviomoura/workspace/org/paa-2020-1.org" "/home/flaviomoura/workspace/org/paa-2020-1planodeensino.org" "/home/flaviomoura/workspace/org/paa-2020-2.org" "/home/flaviomoura/workspace/org/paa-2020-2planoensino.org" "/home/flaviomoura/workspace/org/paa-2021-1.org" "/home/flaviomoura/workspace/org/paa-2021-1planodeensino.org" "/home/flaviomoura/workspace/org/paa-2021-2-lista1.org" "/home/flaviomoura/workspace/org/paa-2021-2.org" "/home/flaviomoura/workspace/org/paa-2021-2planodeensino.org" "/home/flaviomoura/workspace/org/paa-2022-1-avisos.org" "/home/flaviomoura/workspace/org/paa-2022-1-ca.org" "/home/flaviomoura/workspace/org/paa-2022-1-exercicios-p1.org" "/home/flaviomoura/workspace/org/paa-2022-1-exercicios-p2.org" "/home/flaviomoura/workspace/org/paa-2022-1-freq.org" "/home/flaviomoura/workspace/org/paa-2022-1-ga.org" "/home/flaviomoura/workspace/org/paa-2022-1-notas.org" "/home/flaviomoura/workspace/org/paa-2022-1-projeto.org" "/home/flaviomoura/workspace/org/paa-2022-1-prova1.org" "/home/flaviomoura/workspace/org/paa-2022-1-prova2.org" "/home/flaviomoura/workspace/org/paa-2022-1.org" "/home/flaviomoura/workspace/org/paa-2022-1planodeensino.org" "/home/flaviomoura/workspace/org/paa-2022-2-projeto.org" "/home/flaviomoura/workspace/org/paa-2022-2-prova.org" "/home/flaviomoura/workspace/org/paa-2022-2.org" "/home/flaviomoura/workspace/org/paa-2023-1-aula02.org" "/home/flaviomoura/workspace/org/paa-2023-1-aula08.org" "/home/flaviomoura/workspace/org/paa-2023-1-aula11.org" "/home/flaviomoura/workspace/org/paa-2023-1-aula12.org" "/home/flaviomoura/workspace/org/paa-2023-1-aula13.org" "/home/flaviomoura/workspace/org/paa-2023-1-aula14.org" "/home/flaviomoura/workspace/org/paa-2023-1-aula15.org" "/home/flaviomoura/workspace/org/paa-2023-1-aula19.org" "/home/flaviomoura/workspace/org/paa-2023-1-aula20.org" "/home/flaviomoura/workspace/org/paa-2023-1-aula24.org" "/home/flaviomoura/workspace/org/paa-2023-1-aula25.org" "/home/flaviomoura/workspace/org/paa-2023-1-aula26.org" "/home/flaviomoura/workspace/org/paa-2023-1-aula27.org" "/home/flaviomoura/workspace/org/paa-2023-1-aula28.org" "/home/flaviomoura/workspace/org/paa-2023-1-pd.org" "/home/flaviomoura/workspace/org/paa-2023-1-planodeensino.org" "/home/flaviomoura/workspace/org/paa-2023-1-prova1.org" "/home/flaviomoura/workspace/org/paa-2023-1-prova2.org" "/home/flaviomoura/workspace/org/paa-2023-1.org" "/home/flaviomoura/workspace/org/paa-2023-2-Sheila.org" "/home/flaviomoura/workspace/org/paa-2023-2-aula02.org" "/home/flaviomoura/workspace/org/paa-2023-2-planodeensino.org" "/home/flaviomoura/workspace/org/paa-2023-2-prova1.org" "/home/flaviomoura/workspace/org/paa-2023-2-prova2.org" "/home/flaviomoura/workspace/org/paa-2023-2-revisao-prova2.org" "/home/flaviomoura/workspace/org/paa-2023-2.org" "/home/flaviomoura/workspace/org/paa-2024-1.org" "/home/flaviomoura/workspace/org/paa-algoritmos-gulosos.org" "/home/flaviomoura/workspace/org/paa-aula-is-rec-complex.org" "/home/flaviomoura/workspace/org/paa-aula01.org" "/home/flaviomoura/workspace/org/paa-aula02.org" "/home/flaviomoura/workspace/org/paa-aula03.org" "/home/flaviomoura/workspace/org/paa-aula04.org" "/home/flaviomoura/workspace/org/paa-aulas.org" "/home/flaviomoura/workspace/org/paa-cota-inferior.org" "/home/flaviomoura/workspace/org/paa-heapsort.org" "/home/flaviomoura/workspace/org/paa-insertion-sort.org" "/home/flaviomoura/workspace/org/paa-introducao.org" "/home/flaviomoura/workspace/org/paa-is-correcao.org" "/home/flaviomoura/workspace/org/paa-notasdeaulas-old.org" "/home/flaviomoura/workspace/org/paa-notasdeaulas.org" "/home/flaviomoura/workspace/org/paa-np-completude.org" "/home/flaviomoura/workspace/org/paa-programacao-dinamica.org" "/home/flaviomoura/workspace/org/paa-quicksort.org" "/home/flaviomoura/workspace/org/paa-tempo-linear.org" "/home/flaviomoura/workspace/org/paa.org" "/home/flaviomoura/workspace/org/pdf-from-coq.org" "/home/flaviomoura/workspace/org/pensamentos.org" "/home/flaviomoura/workspace/org/pesquisa-projeto-HOM.org" "/home/flaviomoura/workspace/org/pesquisa.org" "/home/flaviomoura/workspace/org/projetos.org" "/home/flaviomoura/workspace/org/psicoterapia.org" "/home/flaviomoura/workspace/org/publications.org" "/home/flaviomoura/workspace/org/receitas.org" "/home/flaviomoura/workspace/org/renatawassermann.org" "/home/flaviomoura/workspace/org/russia.org" "/home/flaviomoura/workspace/org/s4.org" "/home/flaviomoura/workspace/org/schedule.org" "/home/flaviomoura/workspace/org/sf.org" "/home/flaviomoura/workspace/org/smullyanlogicallabyrinths2009.org" "/home/flaviomoura/workspace/org/swartphilosophicalmathematicallogic2018.org" "/home/flaviomoura/workspace/org/symboliclogic.org" "/home/flaviomoura/workspace/org/tasks.org" "/home/flaviomoura/workspace/org/tcc.org" "/home/flaviomoura/workspace/org/teste.org" "/home/flaviomoura/workspace/org/tg1-gabrielTaumaturgo.org" "/home/flaviomoura/workspace/org/tickler.org" "/home/flaviomoura/workspace/org/tikz-orgmode.org" "/home/flaviomoura/workspace/org/tikz-orgmode2.org" "/home/flaviomoura/workspace/org/typetheory.org" "/home/flaviomoura/workspace/org/unb.org" "/home/flaviomoura/workspace/org/unbminutacepe2020.org" "/home/flaviomoura/workspace/org/weeklyreview.org" "/home/flaviomoura/workspace/org/willisonmodelsengagedlearning2020.org" "/home/flaviomoura/workspace/org/zhuProgramTransformationConstructive1995.org" "/home/flaviomoura/workspace/org/zproperty.org")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
