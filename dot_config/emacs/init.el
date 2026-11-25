;;; init.el -*- lexical-binding: t; -*-

;;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq use-package-always-ensure t)

;;; Core
(setq-default indent-tabs-mode t
              tab-width 4
              c-basic-offset 4
              fill-column 80)

(setq custom-file (make-temp-file "emacs-custom-")
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil
      ring-bell-function 'ignore
      use-short-answers t
      inhibit-startup-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

(global-auto-revert-mode 1)
(save-place-mode 1)
(recentf-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)
(delete-selection-mode 1)
(fido-vertical-mode 1)
(column-number-mode 1)

(add-hook 'text-mode-hook #'visual-line-mode)


(add-hook 'emacs-startup-hook
          (lambda ()
            (with-current-buffer "*scratch*"
              (setq buffer-offer-save t
                    buffer-auto-save-file-name
                    (expand-file-name "#scratch-backup#" user-emacs-directory))
              (auto-save-mode 1))))

;;; UI
(load-theme 'modus-vivendi t)
(set-face-attribute 'default nil :height 120)

(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Flat mode-line (no modus-vivendi border).
(custom-set-faces
 '(mode-line          ((t (:background "#505050" :foreground "#ffffff" :box nil))))
 '(mode-line-active   ((t (:background "#505050" :foreground "#ffffff" :box nil))))
 '(mode-line-inactive ((t (:background "#2d2d2d" :foreground "#969696" :box nil)))))

(use-package which-key
  :config (which-key-mode 1))

;;; Programming
(use-package eglot
  :ensure nil
  :hook ((c-mode c++-mode c-ts-base-mode python-base-mode) . eglot-ensure)
  :bind (:map eglot-mode-map
         ("C-c e r" . eglot-rename)
         ("C-c e a" . eglot-code-actions)
         ("C-c e f" . eglot-format))
  :custom (eglot-autoshutdown t))

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode)
  :custom
  (hl-todo-keyword-faces
   '(("TODO"  . (:inherit error   :weight bold))
     ("FIXME" . (:inherit error   :weight bold))
     ("HACK"  . (:inherit warning :weight bold))
     ("NOTE"  . (:inherit success :weight bold)))))

;;; Version control
(use-package magit
  :bind ("C-x g" . magit-status)
  :hook (git-commit-mode . flyspell-mode)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  (magit-save-repository-buffers 'dontask)
  (magit-diff-refine-hunk t))

(use-package diff-hl
  :hook ((prog-mode dired-mode) . diff-hl-mode)
  :hook ((magit-pre-refresh  . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh)))

;;; Shell
(use-package eat)

(defun my/eshell-prompt ()
  "Fish-style prompt: user@host abbr-pwd (branch)."
  (require 'vc-git)
  (let* ((parts (split-string (abbreviate-file-name (eshell/pwd)) "/" t))
         (pwd (mapconcat #'identity
                         (append (mapcar (lambda (p) (substring p 0 1))
                                         (butlast parts))
                                 (last parts))
                         "/"))
         (branch (car (vc-git-branches))))
    (concat (propertize user-login-name 'face '(:foreground "green"))
            "@" (system-name) " "
            (propertize pwd 'face '(:foreground "green"))
            (when branch
              (propertize (format " (%s)" branch) 'face '(:foreground "cyan")))
            (if (zerop (user-uid)) "# " "> "))))

(use-package eshell
  :ensure nil
  :bind ("C-c s" . eshell)
  :hook (eshell-mode . (lambda ()
                         (keymap-local-set "C-l" (lambda ()
                                                   (interactive)
                                                   (eshell/clear t)))))
  :custom
  (eshell-history-size 10000)
  (eshell-hist-ignoredups t)
  (eshell-scroll-to-bottom-on-input 'this)
  (eshell-cmpl-ignore-case t)
  (eshell-buffer-maximum-lines 5000)
  (eshell-highlight-prompt nil)
  (eshell-prompt-regexp "^[^>#\n]*[>#] ")
  (eshell-prompt-function #'my/eshell-prompt))

;;; Writing
(use-package org
  :ensure nil
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :custom
  (org-directory "~/org/")
  (org-agenda-files (list org-directory))
  (org-startup-indented t)
  (org-hide-emphasis-markers t)
  (org-pretty-entities t)
  (org-ellipsis " ▾")
  (org-todo-keywords '((sequence "TODO(t)" "DOING(d)" "|" "DONE(x)" "DROP(c)")))
  (org-log-done 'time)
  (org-return-follows-link t)
  (org-src-preserve-indentation t)
  (org-confirm-babel-evaluate nil)
  (org-capture-templates
   '(("t" "Todo" entry (file+headline "inbox.org" "Tasks") "* TODO %?\n  %U")
     ("n" "Note" entry (file+headline "inbox.org" "Notes") "* %?\n  %U")))
  (org-babel-load-languages
   '((emacs-lisp . t) (shell . t) (python . t) (C . t)))
  :config
  (require 'org-tempo)
  (dolist (f '((org-level-1 . 2.0) (org-level-2 . 1.75)
               (org-level-3 . 1.5) (org-level-4 . 1.25)))
    (set-face-attribute (car f) nil :height (cdr f) :weight 'bold)))

(use-package markdown-mode
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
  (markdown-indent-on-enter 'indent-and-new-item))
