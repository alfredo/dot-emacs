;;; package --- init
;;; Commentary:
;;; Code:
(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory (convert-standard-filename "lisp/")))
(setq custom-file (concat user-emacs-directory (convert-standard-filename "custom.el")))

(load-library "defaults")
(load-library "local-packages")
(load-library "key-bindings")
(load-library "config-projectile")
(load-library "config-helm")
(load-library "config-python")
(load-library "config-org")
(load-library "config-environment")
(load-library "config-color-themes")

(provide 'init)

