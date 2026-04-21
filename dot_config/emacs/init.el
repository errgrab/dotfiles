;; Disable ugly stuff
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)

;; Set some important variables
(setq inhibit-startup-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode
      visible-bell t
      ring-bell-fuunction 'ignore
      custom-file "~/.config/emacs/custom.el")

;; UTF-8 everywhere
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; Keep all backups in one place
(let ((backup-dir "~/.config/emacs/backups/")
      (autosave-dir "~/.config/emacs/autosaves/"))
  (dolist (dir (list backup-dir autosave-dir))
    (unless (file-directory-p dir)
      (make-directory dir t)))
  (setq backup-directory-alist         `((".*" . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,autosave-dir t))
        auto-save-list-file-prefix     (concat autosave-dir ".saves-")))

(setq backup-by-copying    t
      delete-old-versions  t
      kept-new-versions    6
      kept-old-versions    2
      version-control      t)

;; Coding style
(setq-default indent-tabs-mode nil
	          tab-width 4
	          c-basic-offset 4
	          js-indent-level 2
	          css-indent-offset 2)
(setq electric-indent-inhibit nil)
(electric-pair-mode 1)

(add-hook 'c-mode-hook
          (lambda () (c-set-style "k&r") (setq c-basic-offset 4)))
(add-hook 'c++-mode-hook
          (lambda () (c-set-style "k&r") (setq c-basic-offset 4)))
(add-hook 'python-mode-hook
          (lambda () (setq python-indent-offset 4)))

;; Enable some aditional things
(column-number-mode t)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Change font
(set-face-attribute 'default nil :font "Iosevka NF" :height 120)

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

;; Setup theme
(load-theme 'modus-vivendi)

;; Modeline more likable
(use-package doom-modeline
  :init (doom-modeline-mode 1))

(cua-mode 1)
(setq cua-keep-region-after-copy t)

(use-package multiple-cursors
  :bind (("M-n" . mc/mark-next-like-this)
         ("M-p" . mc/mark-previous-like-this)
         ("C-M-a" . mc/mark-all-like-this)))
