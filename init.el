(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/emacs1/.emacs.d/config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method 'synctex)
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(org-agenda-files
   '("~/workspace-git/PAA-github/paa-notasdeaulas.org" "~/workspace-git/PAA-github/paa-2020-1.org" "/Users/flaviomoura/beorg/org/2019Abr dietaDengo.org" "/Users/flaviomoura/beorg/org/2019Abr planodeTrabalhoGabriel.org" "/Users/flaviomoura/beorg/org/2019Abr planodetrabalhoFelipe.org" "/Users/flaviomoura/beorg/org/2019Abr projetopibicLeandro.org" "/Users/flaviomoura/beorg/org/2019Abr reviewITP2019.org" "/Users/flaviomoura/beorg/org/2019Abr tereseA1-A3.org" "/Users/flaviomoura/beorg/org/2019Abr tg1-gabriel-taumaturgo.org" "/Users/flaviomoura/beorg/org/2019Abr tg1-gerson-antunes.org" "/Users/flaviomoura/beorg/org/2019Abr trancamentoMichelMelo.org" "/Users/flaviomoura/beorg/org/2019AbrMichelMelo.org" "/Users/flaviomoura/beorg/org/2019Abr_Zprop.org" "/Users/flaviomoura/beorg/org/2019Abr_Zprop.orgGitHub.org" "/Users/flaviomoura/beorg/org/MSNorm.org" "/Users/flaviomoura/beorg/org/abel19_failur_normal_impred_type_theor.org" "/Users/flaviomoura/beorg/org/abelfailurenormalizationimpredicative2020.org" "/Users/flaviomoura/beorg/org/adm-unb-parecerCADE2019.org" "/Users/flaviomoura/beorg/org/adm-unb-proposta-ccar2020-1.org" "/Users/flaviomoura/beorg/org/adm-unb-proposta-graduacao.org" "/Users/flaviomoura/beorg/org/arquivo_inicial.org" "/Users/flaviomoura/beorg/org/ayala_rinconappliedlogiccomputer2017.org" "/Users/flaviomoura/beorg/org/belle20_symbol_logic_meets_machin_learn.org" "/Users/flaviomoura/beorg/org/bruijn72:_lambd_churc_rosser.org" "/Users/flaviomoura/beorg/org/colegiado-cic-pauta2020.org" "/Users/flaviomoura/beorg/org/colegiado-cic-relatorio2019Set.org" "/Users/flaviomoura/beorg/org/compositionalZ.org" "/Users/flaviomoura/beorg/org/coq.org" "/Users/flaviomoura/beorg/org/coquand20_loren_proof_consis_elemen_number.org" "/Users/flaviomoura/beorg/org/cv.org" "/Users/flaviomoura/beorg/org/diary.org" "/Users/flaviomoura/beorg/org/drabent19_correc_n_queen_progr.org" "/Users/flaviomoura/beorg/org/du2020mechanized.org" "/Users/flaviomoura/beorg/org/ensino.org" "/Users/flaviomoura/beorg/org/file_idrive_documents_iptu2020_pdf_iptu_2020.org" "/Users/flaviomoura/beorg/org/financas.org" "/Users/flaviomoura/beorg/org/financas2017.org" "/Users/flaviomoura/beorg/org/flavio.org" "/Users/flaviomoura/beorg/org/ic-projeto-2019-2020.org" "/Users/flaviomoura/beorg/org/ic.org" "/Users/flaviomoura/beorg/org/iiiguideteachingpuzzlebased2014.org" "/Users/flaviomoura/beorg/org/index.org" "/Users/flaviomoura/beorg/org/inicial.org" "/Users/flaviomoura/beorg/org/lc1.org" "/Users/flaviomoura/beorg/org/lnr.org" "/Users/flaviomoura/beorg/org/lrt.org" "/Users/flaviomoura/beorg/org/lsfa2014.org" "/Users/flaviomoura/beorg/org/lsfa2017.org" "/Users/flaviomoura/beorg/org/martin20_pure_patter_calcul_la_de_bruij.org" "/Users/flaviomoura/beorg/org/matching.org" "/Users/flaviomoura/beorg/org/meuteste.org" "/Users/flaviomoura/beorg/org/mollermodellingcomputingsystems2013.org" "/Users/flaviomoura/beorg/org/nominal.org" "/Users/flaviomoura/beorg/org/ohtsukaproofsubstitutionlemma1993.org" "/Users/flaviomoura/beorg/org/oostrom20.org" "/Users/flaviomoura/beorg/org/org-show.org" "/Users/flaviomoura/beorg/org/orgroam.org" "/Users/flaviomoura/beorg/org/paa.org" "/Users/flaviomoura/beorg/org/pesquisa-projeto.org" "/Users/flaviomoura/beorg/org/pesquisa.org" "/Users/flaviomoura/beorg/org/publications.org" "/Users/flaviomoura/beorg/org/russia.org" "/Users/flaviomoura/beorg/org/s4.org" "/Users/flaviomoura/beorg/org/smullyanlogicallabyrinths2009.org" "/Users/flaviomoura/beorg/org/swartphilosophicalmathematicallogic2018.org" "/Users/flaviomoura/beorg/org/symboliclogic.org" "/Users/flaviomoura/beorg/org/tasks.org" "/Users/flaviomoura/beorg/org/tcc.org" "/Users/flaviomoura/beorg/org/tg1-gabrielTaumaturgo.org" "/Users/flaviomoura/beorg/org/tikz-orgmode.org" "/Users/flaviomoura/beorg/org/tikz-orgmode2.org" "/Users/flaviomoura/beorg/org/trabalho.org" "/Users/flaviomoura/beorg/org/typetheory.org" "/Users/flaviomoura/beorg/org/unb.org" "/Users/flaviomoura/beorg/org/unbminutacepe2020.org" "/Users/flaviomoura/beorg/org/willisonmodelsengagedlearning2020.org" "/Users/flaviomoura/beorg/org/zhuProgramTransformationConstructive1995.org" "/Users/flaviomoura/beorg/org/zproperty.org"))
 '(package-selected-packages
   '(ivy-bibtex tuareg auctex-latexmk company-org-roam org-roam-bibtex org-roam orgit zenburn-theme vscode-dark-plus-theme use-package ubuntu-theme try smartparens proof-general ox-reveal org-ref org-noter org-journal modus-vivendi-theme modus-operandi-theme magit git-timemachine git-gutter flycheck-irony company-irony bbdb auctex ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
