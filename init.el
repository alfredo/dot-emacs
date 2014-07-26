; Load directories
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (concat user-emacs-directory
                                (convert-standard-filename "plugins/")))

(load-library "defaults")
;; package install
(load-library "config-package")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes (quote ("bc89fda3d232a3daa4eb3a9f87d6ffe1272fea46e4cf86686d9e8078e4209e2c" "7dd515d883520286fc8936ce32381fb01b978d0d7cfb6fe56f7f55d8accbf63a" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(grep-program "ack -H -a --nogroup" t))

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
;; css setup
(load-library "config-css")
;; javascript setup
(load-library "config-javascript")
;; custom setup
(load-library "config-custom")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:background "#6c71c4" :foreground "#ffffff"))))
 '(flymake-warnline ((((class color)) (:background "#0a2832")))))
