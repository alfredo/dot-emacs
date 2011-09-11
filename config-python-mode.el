;; python config
(require 'python)

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))
(add-hook 'python-mode-hook 'flymake-mode)
(load-library "flymake-cursor")

(custom-set-faces
 '(flymake-errline ((((class color)) (:background "LightYellow"))))
 '(flymake-warnline ((((class color)) (:background "LightBlue2" :underline "Yellow")))))

;; (custom-set-faces
;;  '(flymake-errline ((((class color)) (:background "LightYellow" :underline "OrangeRed"))))
;;  '(flymake-warnline ((((class color)) (:background "LightBlue2" :underline "Yellow")))))

; (autoload 'python-mode "python-mode.el" "Python mode." t)
; (setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

;(setq python-python-command "ipython")
                                        ;(setq py-python-command-args '( "-colors" "Linux"))
;(require 'ipython)


; bind RET to py-newline-and-indent
;(add-hook 'python-mode-hook '(lambda ()
;     (define-key python-mode-map "\C-m" 'newline-and-indent)))

;(setq ropemacs-enable-shortcuts nil)
;(setq ropemacs-local-prefix "C-c C-p")
;(require 'pymacs)
;(pymacs-load "ropemacs" "rope-")
;(setq ropemacs-enable-autoimport 't)

;; virtualenv loading
;;(add-hook 'python-mode-hook '(lambda () (require 'virtualenv)))

;; (load "django-mode")
;; (load "django-html-mode")

(defun django-insert-trans-block (from to &optional buffer)
 (interactive "*r")
 (save-excursion
   (save-restriction
     (narrow-to-region from to)
     (goto-char from)
     (iso-iso2sgml from to)
     (insert "{% blocktrans %}")
     (goto-char (point-max))
     (insert "{% endblocktrans %}")
     (point-max))))

(defun django-insert-trans (from to &optional buffer)
 (interactive "*r")
 (save-excursion
   (save-restriction
     (narrow-to-region from to)
     (goto-char from)
     (iso-iso2sgml from to)
     (insert "{% trans \"")
     (goto-char (point-max))
     (insert "\" %}")
     (point-max))))

(add-hook 'sgml-mode-hook
        (lambda ()
          (local-set-key "\C-c\C-g" 'django-insert-trans)
          (setq indent-tabs-mode nil)
          ))
(add-hook 'sgml-mode-hook
        (lambda ()
          (local-set-key "\C-c\C-t" 'django-insert-trans-block)
          (setq indent-tabs-mode nil)
          ))
