(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

(blink-cursor-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(setq inhibit-splash-screen t)
(setq initial-scratch-message "")

(when (member "Iosevka" (font-family-list))
  (set-face-attribute 'default nil :family "Iosevka"))
(set-face-attribute 'default nil :height 140 :weight 'normal)

(custom-set-faces
 '(default ((t (:background "black" :foreground "grey"))))
 '(fringe ((t (:background "black")))))

(global-display-line-numbers-mode 1)

;; (require 'use-package)
;; (use-package evil
;;   :ensure t
;;   :config
;;   (evil-mode 1))
