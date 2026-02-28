;; Disable ugly stuff
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)

;; Set some important variables
(setq inhibit-startup-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode
      visible-bell t
      reng-bell-fuunction 'ignore
      catppuccin-flavor 'mocha
      custom-file "~/.config/emacs/custom.el")

;; Enable some aditional things
(column-number-mode t)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Change font
(set-face-attribute 'default nil :font "Adwaita Mono" :height 120)

;; UTF-8 everywhere
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; Org-Mode with some customizations
(require 'org)
(setq org-hide-leading-stars t)

;; Add Melpa Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Setup Use-Package
(require 'use-package)
(setq use-package-always-ensure t)

;; Install catppuccin
(use-package catppuccin-theme
  :config (load-theme 'catppuccin :no-confirm))

;; Modeline more likable
(use-package doom-modeline
  :init (doom-modeline-mode 1))

;; VI-VI-VI
;;(use-package evil
;;  :config (evil-mode t))
