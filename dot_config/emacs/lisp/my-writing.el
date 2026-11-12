;;; writing.el -*- lexical-binding: t; -*-

(use-package org
  :ensure nil
  :hook ((org-mode . visual-line-mode)
         (org-mode . my/no-line-numbers))
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
  (dolist (f '((org-level-1 . 2.0) (org-level-2 . 1.75)
               (org-level-3 . 1.5) (org-level-4 . 1.25)))
    (set-face-attribute (car f) nil :height (cdr f) :weight 'bold)))

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :hook ((markdown-mode . visual-line-mode)
         (markdown-mode . my/no-line-numbers))
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

(provide 'my-writing)
