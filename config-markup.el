;; mark up config
(setq magic-mode-alist nil)
;; ;; disable autofill
(setq auto-mode-alist (cons '("\\.gsp$" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.html$" . html-mode) auto-mode-alist))
(add-hook 'html-mode-hook 'turn-off-auto-fill)


;; PHP mode
;;(autoload 'php-mode "php-mode.el" "Php mode." t)
;;(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))
