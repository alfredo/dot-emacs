;; python config
(require 'python)

;; Nope, I want my copies in the system temp dir.
(setq flymake-run-in-place nil)

;; Use this to debug flymake
;; (setq flymake-log-level 3)

(custom-set-faces
 '(flymake-errline ((((class color)) (:background "#6c71c4" :foreground "#ffffff"))))
 '(flymake-warnline ((((class color)) (:background "#0a2832")))))

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

;; (add-hook 'text-mode-hook 'turn-on-flyspell)
;; (add-hook 'python-mode-hook 'flyspell-prog-mode)
