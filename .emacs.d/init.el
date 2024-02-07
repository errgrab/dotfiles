;; Setup packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Disable ugly things
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(setq inhibit-startup-screen t)

;; Tabs configuration
(setq-default tab-width 4
			  c-default-style "bsd"
			  c-basic-offset 4
			  indent-tabs-mode t)

(setq c-basic-offset 4)

;; Show invisible characters
(global-whitespace-mode t)
(setq whitespace-style '(face tabs trailing lines
	space-before-tab indentation empty space-after-tab
	tab-mark))

;; Disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Install use-package framework for packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t
	  use-package-expand-minimally t)

;; Theme
(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox-dark-hard t))

;; Magit
(use-package magit
  :bind (("C-x g" . magit-status)
		 ("C-x C-g" . magit-status)))

;; Line numbers
(use-package display-line-numbers
  :hook (prog-mode . display-line-numbers-mode))

(use-package smex
  :bind (("M-x" . smex)
		 ("C-c C-c M-x" . execute-extended-command)))

(use-package ido
  :config
  (ido-mode 1)
  (ido-everywhere 1))

(use-package evil
  :config
  (evil-mode 1)
  (evil-define-key 'insert global-map (kbd "<tab>")
	(lambda () (interactive) (insert "\t"))))
