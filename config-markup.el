;; mark up config
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (cons '("\\.html$" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.fbml$" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gsp$" . html-mode) auto-mode-alist))

;; PHP mode
(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))
