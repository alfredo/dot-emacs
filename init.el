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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil)
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
