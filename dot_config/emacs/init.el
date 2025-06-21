(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)

(setq inhibit-startup-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

(set-face-attribute 'default nil :font "ZedMono Nerd Font" :height 120)

(load-theme 'modus-vivendi t)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

(require 'org)
(setq org-hide-leading-stars t)
