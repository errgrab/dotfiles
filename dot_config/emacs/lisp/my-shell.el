;;; shell.el -*- lexical-binding: t; -*-

(use-package eat
  :ensure t
;;  :hook (eat-mode . my/no-line-numbers)
  )

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

(defun my/eshell-setup ()
;;  (my/no-line-numbers)
  (keymap-local-set "C-l" (lambda () (interactive) (eshell/clear t))))

(use-package eshell
  :ensure nil
  :bind ("C-c s" . eshell)
  :hook (eshell-mode . my/eshell-setup)
  :custom
  (eshell-history-size 10000)
  (eshell-hist-ignoredups t)
  (eshell-scroll-to-bottom-on-input 'this)
  (eshell-cmpl-ignore-case t)
  (eshell-buffer-maximum-lines 5000)
  (eshell-highlight-prompt nil)
  (eshell-prompt-regexp "^[^>#\n]*[>#] ")
  (eshell-prompt-function #'my/eshell-prompt))

(provide 'my-shell)
