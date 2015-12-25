(setenv "LC_CTYPE" "UTF-8")

;;(setq flymake-python-pyflakes-executable "flake8")

(setq flymake-python-pyflakes-executable "pyflakespep8")

;; run flymake automatically
(when (load "flymake" t)
  (defun flymake-pychecker-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-in-system-tempdir))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list pyflymakeexec (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pychecker-init)))

(add-hook 'python-mode-hook 'flymake-mode)
(load-library "flymake-cursor")

(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(defun flymake-python-pyflakes-warn-regex (executable)
  "Return a regex which identifies warnings output by EXECUTABLE."
  (if (string-match-p "pyflakes" executable)
      "\\(.*Warning.*\\|^redefinition\\|.*unused.*\\|used$\\)"
    "^\\([WFCN]\\|E[0-7]\\)"))

(custom-set-variables
 '(help-at-pt-timer-delay 0.5)
 '(help-at-pt-display-when-idle '(flymake-overlay)))

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

(defun jinja2-insert-trans (from to &optional buffer)
  (interactive "*r")
  (save-excursion
    (save-restriction
      (narrow-to-region from to)
      (goto-char from)
      (iso-iso2sgml from to)
      (insert "{{ _(\"")
      (goto-char (point-max))
      (insert "\") }}")
      (point-max))))


(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)
