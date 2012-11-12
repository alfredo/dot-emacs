;;(color-theme-tomorrow-night-eighties)

(color-theme-sanityinc-solarized-dark)

;; (load-theme 'cyberpunk t)

(custom-set-faces
 '(flymake-errline ((((class color)) (:background "#6c71c4" :foreground "#ffffff"))))
 '(flymake-warnline ((((class color)) (:background "#0a2832")))))

(add-to-list 'load-path (concat user-emacs-directory
                         (convert-standard-filename "plugins/nyan-mode/")))

 (require 'nyan-mode)
 (add-hook 'text-mode-hook (lambda () (nyan-mode t)))
 (add-hook 'python-mode-hook (lambda () (nyan-mode t)))