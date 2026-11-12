;;; ui.el -*- lexical-binding: t; -*-

(load-theme 'modus-vivendi t)
(set-face-attribute 'default nil :height 120)

(column-number-mode 1)
(use-package display-line-numbers
  :ensure nil
  :custom
  (display-line-numbers-type 'relative)
  :hook (prog-mode . display-line-numbers-mode))

(defun my/no-line-numbers ()
  "Hook helper: disable line numbers in the current buffer."
  (display-line-numbers-mode -1))

;; Flat mode-line (no modus-vivendi border).
(custom-set-faces
 '(mode-line          ((t (:background "#505050" :foreground "#ffffff" :box nil))))
 '(mode-line-active   ((t (:background "#505050" :foreground "#ffffff" :box nil))))
 '(mode-line-inactive ((t (:background "#2d2d2d" :foreground "#969696" :box nil)))))

;; Show available keys after a prefix.
(use-package which-key
  :ensure t
  :config (which-key-mode 1))

(provide 'my-ui)
