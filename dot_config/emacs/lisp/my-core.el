;;; core.el -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

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

(defun my/setup-scratch-buffer ()
  (with-current-buffer "*scratch*"
	(setq buffer-offer-save t
		  buffer-auto-save-file-name
		  (expand-file-name "#scratch-backup#" user-emacs-directory))
	(auto-save-mode 1)))

(add-hook 'emacs-startup-hook #'my/setup-scratch-buffer)

;; TODO: think on a better window manipulation
; (keymap-global-set "C-c C-<up>"    #'windmove-up)
; (keymap-global-set "C-c C-<down>"  #'windmove-down)
; (keymap-global-set "C-c C-<left>"  #'windmove-left)
; (keymap-global-set "C-c C-<right>" #'windmove-right)

(provide 'my-core)
