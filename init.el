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

(setq user-full-name "Flávio L. C. de Moura")
(setq user-mail-address "flavio.de.moura@gmail.com")

(global-set-key (kbd "M-=") 'text-scale-increase)
(global-set-key (kbd "M--") 'text-scale-decrease)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(setq ring-bell-function 'ignore)

(show-paren-mode 1)

(use-package company :straight t)

(use-package ef-themes
  :straight t
  :config (load-theme 'ef-light t))  

(use-package ivy
    :straight t
    :config
    (ivy-mode 1))
  (use-package ivy-bibtex
    :straight t)


(defun my/copilot-tab ()
  (interactive)
  (or (copilot-accept-completion)
      (indent-for-tab-command)))

(straight-use-package '(copilot :host github :repo "zerolfx/copilot.el" :files ("dist" "*.el")))
(require 'copilot)

(add-hook 'prog-mode-hook 'copilot-mode)

(use-package bbdb
 :straight t
 :config
   (setq bbdb-file "~/Dropbox/bbdb"))

(use-package magit
  :straight t
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-repository-directories '(("~/.emacs.d" . 0)
                                       ("~/workspace/" . 2))))

(use-package forge
  :ensure t)

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
              pos
            -1))))

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

