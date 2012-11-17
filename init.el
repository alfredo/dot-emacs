; Load directories
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (concat user-emacs-directory
                                (convert-standard-filename "plugins/")))

(load-library "defaults")
;; package install
(load-library "config-package")
;; environment setup
(load-library "config-environment")
;; key bindings
(load-library "config-key-bindings")
;; ido config
(load-library "config-ido")
;; yas config
(load-library "config-yas")
;; themes
(load-library "config-color-themes")
;; python mode
(load-library "config-python")
;; custom setup
(load-library "config-custom")
