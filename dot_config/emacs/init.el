;;; init.el -*- lexical-binding: t; -*-

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(dolist (m '(my-core my-ui my-prog my-vc my-shell my-writing))
  (require m))
