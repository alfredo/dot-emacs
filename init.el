; Load directories
;; (add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (concat user-emacs-directory
                                (convert-standard-filename "lisp/")))
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
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#708183" "#c60007" "#728a05" "#a57705" "#2075c7" "#c61b6e" "#259185" "#042028"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes (quote ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "8d33dd4dc3a1c6c360f5391a949ceba1c5762a035044b29381dae04eaf61e77e" "7fde61efa16011b294db1448de9e0ae45d602ae949a640164bce6fece4420e90" "bc89fda3d232a3daa4eb3a9f87d6ffe1272fea46e4cf86686d9e8078e4209e2c" "7dd515d883520286fc8936ce32381fb01b978d0d7cfb6fe56f7f55d8accbf63a" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(fci-rule-color "#0a2832")
 '(grep-program "ack -H -a --nogroup" t)
 '(magit-diff-options nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#c60007") (40 . "#bd3612") (60 . "#a57705") (80 . "#728a05") (100 . "#259185") (120 . "#2075c7") (140 . "#c61b6e") (160 . "#5859b7") (180 . "#c60007") (200 . "#bd3612") (220 . "#a57705") (240 . "#728a05") (260 . "#259185") (280 . "#2075c7") (300 . "#c61b6e") (320 . "#5859b7") (340 . "#c60007") (360 . "#bd3612"))))
 '(vc-annotate-very-old-color nil))

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
(put 'narrow-to-region 'disabled nil)
