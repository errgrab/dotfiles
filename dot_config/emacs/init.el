;;; init.el -*- lexical-binding: t; -*-

;; UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(load-theme 'modus-vivendi t)
(set-face-attribute 'default nil :height 120)
(column-number-mode 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; Remove ugly mode-line boder from modus-vivendi
(custom-set-faces
 '(mode-line ((t (:background "#505050" :foreground "#ffffff" :box nil))))
 '(mode-line-active ((t (:background "#505050" :foreground "#ffffff" :box nil))))
 '(mode-line-inactive ((t (:background "#2d2d2d" :foreground "#969696" :box nil)))))

;; Code stuff
(setq-default indent-tabs-mode t
              tab-width 4
              c-basic-offset 4
              fill-column 80)

;; Basics
(setq custom-file (make-temp-file "emacs-custom-")
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil
      ring-bell-function 'ignore
      use-short-answers t
      inhibit-startup-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

;; TODO: review this
(global-auto-revert-mode 1)
(save-place-mode 1)
(recentf-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)
(delete-selection-mode 1)
(fido-vertical-mode 1)

;; Save scratch buffer
(defun my-setup-scratch-buffer ()
  "Configure the *scratch* buffer to prompt on exit and auto-save."
  (when (get-buffer "*scratch*")
	(with-current-buffer "*scratch*"
	  (setq buffer-offer-save t
			buffer-auto-save-file-name (expand-file-name "#scratch-backup#" use-emacs-directory))
	  (auto-save-mode 1))))
(add-hook 'emacs-startup-hook #'my-setup-scratch-buffer)

;; TODO: think on a better window manipulation
(keymap-global-set "C-c C-<up>"    #'windmove-up)
(keymap-global-set "C-c C-<down>"  #'windmove-down)
(keymap-global-set "C-c C-<left>"  #'windmove-left)
(keymap-global-set "C-c C-<right>" #'windmove-right)

;; LSP
;; TODO: fix binding collision with eshell
(add-hook 'prog-mode-hook #'eglot-ensure)
(setq eglot-autoshutdown t)
(with-eval-after-load 'eglot
  (keymap-set eglot-mode-map "C-c e r" #'eglot-rename)
  (keymap-set eglot-mode-map "C-c e a" #'eglot-code-actions)
  (keymap-set eglot-mode-map "C-c e f" #'eglot-format))

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; To know which key do each thing
(use-package which-key
  :ensure t
  :config (which-key-mode 1))

;; TODO: Highlight to-dos
(use-package hl-todo
  :ensure t
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-keyword-faces
        '(("TODO"  . (:inherit error :weight bold))
          ("FIXME" . (:inherit error :weight bold))
          ("HACK"  . (:inherit warning :weight bold))
          ("NOTE"  . (:inherit success :weight bold)))))

;; "modern" Terminal emulator
(use-package eat
  :ensure t
  :hook (eat-mode . (lambda () (display-line-numbers-mode -1))))

;; Eshell
(use-package eshell
  :ensure nil
  :bind ("C-c e" . eshell)
  :custom
  (eshell-history-size 10000)
  (eshell-hist-ignoredups t)
  (eshell-scroll-to-bottom-on-input 'this)
  (eshell-cmpl-ignore-case t)
  (eshell-buffer-maximum-lines 5000)
  (eshell-highlight-prompt nil)
  (eshell-prompt-regexp "^[^>#\n]*[>#] ")

  :config
  (defun my/eshell-prompt ()
	"Fish-style prompt: user@host abbr-pwd (branch)."
	(require 'vc-git)
	(let* ((parts (split-string (abbreviate-file-name (eshell/pwd)) "/" t))
		   (pwd (mapconcat #'identity
						   (append (mapcar (lambda (p) (substring p 0 1)) (butlast parts))
								   (last parts))
						   "/"))
		   (branch (car (vc-git-branches))))
	  (concat (propertize user-login-name 'face '(:foreground "green")) "@" (system-name) " "
			  (propertize pwd 'face '(:foreground "green"))
			  (when branch
				(propertize (format " (%s)" branch) 'face '(:foreground "cyan")))
			  (if (zerop (user-uid)) "# " "> "))))
  (setq eshell-prompt-function #'my/eshell-prompt)

  (add-hook 'term-mode-hook
			(lambda ()
			  (display-line-numbers-mode -1)
			  ;(setq-local mode-line-format nil)
			  (setq truncate-lines t)))
  
  (defun my/eshell-setup ()
	"Minimal eshell local settings."
	(display-line-numbers-mode -1)
	(keymap-local-set "C-l" (lambda () (interactive) (eshell/clear t)))
	(keymap-local-set "C-r" #'consult-history))
  (add-hook 'eshell-mode-hook #'my/eshell-setup))

;; Magit
(use-package magit
  :ensure t
  :bind (("C-x g"   . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c g f" . magit-file-dispatch)
         ("C-c g b" . magit-blame-addition)
         ("C-c g l" . magit-log-buffer-file))
  :hook (git-commit-mode . flyspell-mode)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  (magit-save-repository-buffers 'dontask)
  (magit-diff-refine-hunk t))

;; Diff mode for magit
(use-package diff-hl
  :ensure t
  :hook ((prog-mode dired-mode) . diff-hl-mode)
  :config
  (add-hook 'magit-pre-refresh-hook #'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh))

;; Org
(use-package org
  :ensure nil
  :hook ((org-mode . visual-line-mode)
         (org-mode . (lambda () (display-line-numbers-mode -1))))
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :custom
  (org-directory "~/org/")
  (org-default-notes-file (expand-file-name "inbox.org" org-directory))
  (org-agenda-files (list org-directory))
  (org-startup-indented t)
  (org-hide-emphasis-markers t)
  (org-pretty-entities t)
  (org-ellipsis " ▾")
  (org-todo-keywords '((sequence "TODO(t)" "DOING(d)" "|" "DONE(x)" "DROP(c)")))
  (org-log-done 'time)
  (org-return-follows-link t)
  (org-edit-src-content-indentation 0)
  (org-src-preserve-indentation t)
  (org-confirm-babel-evaluate nil)
  (org-capture-templates
   '(("t" "Todo" entry (file+headline "inbox.org" "Tasks") "* TODO %?\n  %U")
     ("n" "Note" entry (file+headline "inbox.org" "Notes") "* %?\n  %U")))
  (org-babel-load-languages
   '((emacs-lisp . t) (shell . t) (python . t) (C . t)))
  :config
  (require 'org-tempo)
  (set-face-attribute 'org-level-1 nil :height 2.0  :weight 'bold)
  (set-face-attribute 'org-level-2 nil :height 1.75 :weight 'bold)
  (set-face-attribute 'org-level-3 nil :height 1.5  :weight 'bold)
  (set-face-attribute 'org-level-3 nil :height 1.25 :weight 'bold))

;; Markdown
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
		 ("\\.md\\'" . markdown-mode)
		 ("\\.markdown\\'" . markdown-mode))
  :custom
  (markdown-command "pandoc")
  (markdown-hide-markup t)
  (markdown-hide-urls t)
  (markdown-fontify-code-blocks-natively t)
  (markdown-enable-math t)
  (markdown-header-scaling t)
  (markdown-header-scaling-values '(2.0 1.75 1.5 1.25 1.1 1.0))
  (markdown-asymmetric-header t)
  (markdown-list-indent-width 2)
  (markdown-indent-on-enter 'indent-and-new-item)
  :hook
  ((markdown-mode . visual-line-mode)
   (markdown-mode . (lambda () (display-line-numbers-mode -1))))
  :config
  (markdown-update-header-faces markdown-header-scaling
								markdown-header-scaling-values)
  (dolist (face '(markdown-header-face-1
				  markdown-header-face-2
				  markdown-header-face-3
				  markdown-header-face-4
				  markdown-header-face-5
				  markdown-header-face-6))
	(set-face-attribute face nil :weight 'bold)))
