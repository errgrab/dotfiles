;;; prog.el -*- lexical-binding: t; -*-

;; LSP, only where a server is expected.
(dolist (h '(c-mode-hook c-ts-mode-hook c++-mode-hook c++-ts-mode-hook
             python-mode-hook python-ts-mode-hook))
  (add-hook h #'eglot-ensure))

(setq eglot-autoshutdown t)

(with-eval-after-load 'eglot
  (keymap-set eglot-mode-map "C-c e r" #'eglot-rename)
  (keymap-set eglot-mode-map "C-c e a" #'eglot-code-actions)
  (keymap-set eglot-mode-map "C-c e f" #'eglot-format))

(use-package hl-todo
  :ensure t
  :hook (prog-mode . hl-todo-mode)
  :custom
  (hl-todo-keyword-faces
   '(("TODO"  . (:inherit error   :weight bold))
     ("FIXME" . (:inherit error   :weight bold))
     ("HACK"  . (:inherit warning :weight bold))
     ("NOTE"  . (:inherit success :weight bold)))))

(provide 'my-prog)
