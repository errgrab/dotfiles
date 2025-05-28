;; Basic
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(tooltip-mode 0)
(blink-cursor-mode 0)
(toggle-frame-maximized)

;; Variables
(setq
 backup-directory-alist '(("." . "~/.emacs.d/backups"))
 auto-save-file-name-transforms '((".*" "~/.emacs.d/backups/" t))
 inhibit-startup-message t
 initial-scratch-message nil)

;; Don't change init.el
(setq custom-file "~/.config/emacs/custom.el")
(load custom-file 'noerror)

(setq-default
 indent-tabs-mode t
 tab-width 4
 c-basic-offset 4)

;; Line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Easily open config
(global-set-key (kbd "C-c i") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

;; Font
(when (member "IosevkaTerm" (font-family-list))
  (set-face-attribute 'default nil :font "IosevkaTerm"))
(set-face-attribute 'default nil :height 120 :weight 'normal)

;; Use melpa repository
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-enable-at-startup nil)
(package-initialize)

;; Initialize use-package
(require 'use-package)
(setq use-package-always-ensure t)

(use-package doom-themes
  :init (load-theme 'doom-tokyo-night t))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package company
  :hook (lsp-mode . company-mode)
  :config (global-company-mode t))

(use-package ivy
  :bind (("C-s" . swiper)
		 ("M-x" . counsel-M-x))
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))

(use-package counsel
  :config
  (counsel-mode t)
  (setq counsel-M-x-history nil))

(use-package swiper
  :bind (("C-s" . swiper-isearch)
		 ("C-r" . swiper-isearch-C-r)))

(use-package which-key
  :config (which-key-mode t))

(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
		 ("C-<" . mc/mark-previous-like-this)
		 ("C-c C-<" . mc/mark-all-like-this)))

(use-package markdown-mode
  :mode "\\.md\\'")

(use-package grip-mode
  :config (setq grip-command 'go-grip)
  :hook ((markdown-mode org-mode) . grip-mode))

(use-package lsp-mode
  :hook ((c-mode . lsp)
		 (c-or-c++-mode . lsp)
		 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil
		lsp-idle-delay 0.5))

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable t))

(use-package use-package-chords
  :config (key-chord-mode t))

(use-package ace-jump-mode
  :chords (("jj" . ace-jump-char-mode)
		   ("jk" . ace-jump-word-mode)
		   ("jl" . ace-jump-line-mode)))

(use-package phi-search)
;;  :bind (("C-s" . phi-search)
;; 		 ("C-r" . phi-search-backward)))
