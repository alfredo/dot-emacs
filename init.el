;;; package --- init
;;; Commentary:
;;; Code:

(add-to-list 'load-path (concat user-emacs-directory (convert-standard-filename "lisp/")))

(load-library "defaults")
(load-library "local-packages")
(load-library "key-bindings")
(load-library "config-projectile")
(load-library "config-environment")
(load-library "config-color-themes")

(provide 'init)

