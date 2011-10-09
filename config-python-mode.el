;; python config
;;(require 'python)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-inplace))
       (local-file (file-relative-name
            temp-file
            (file-name-directory buffer-file-name))))
      (list "pycheckers"  (list local-file))))
   (add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'python-mode-hook 'flymake-mode)
(load-library "flymake-cursor")

(custom-set-faces
 '(flymake-errline ((((class color)) (:background "#ffffd7"))))
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

(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'python-mode-hook 'flyspell-prog-mode)
