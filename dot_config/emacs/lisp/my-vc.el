;;; vc.el -*- lexical-binding: t; -*-

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

(use-package diff-hl
  :ensure t
  :hook ((prog-mode dired-mode) . diff-hl-mode)
  :hook ((magit-pre-refresh  . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh)))

(provide 'my-vc)
