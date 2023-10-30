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


(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;;       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;;       (bootstrap-version 5))
;;   (unless (file-exists-p bootstrap-file)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
;;         'silent 'inhibit-cookies)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   (load bootstrap-file nil 'nomessage))

