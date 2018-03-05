;; Load directories

(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory
                                (convert-standard-filename "lisp/")))
(setq custom-file (concat user-emacs-directory
                                (convert-standard-filename "custom.el")))

(load-library "defaults")
;; package install
(load-library "config-package")
;; key bindings
(load-library "config-key-bindings")
;; projectile config
(load-library "config-projectile")
;; helm setup
(load-library "config-helm")
;; yas config
(load-library "config-yas")
;; python mode
(load-library "config-python")
;; python mode
(load-library "config-maggit")
;; javascript setup
(load-library "config-javascript")
;; eshell
(load-library "config-eshell")
;; org mode
(load-library "config-org")
;; custom setup
(load-library "config-custom")
;; environment setup
(load-library "config-environment")
;; themes
(load-library "config-color-themes")

(provide 'init)
