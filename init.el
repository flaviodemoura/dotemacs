;; add MELPA package server
(require 'package)

(add-to-list 'package-archives 
  '("melpa" . "http://melpa.milkbox.net/packages/"))

(unless package-archive-contents
  (package-refresh-contents))

(package-initialize)

;; if not yet installed, install package use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; load org package and our emacs-config.org file
(require 'org)
(org-babel-load-file "config.org") 

