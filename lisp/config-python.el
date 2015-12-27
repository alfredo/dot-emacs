(setenv "LC_CTYPE" "UTF-8")

(setq flymake-python-pyflakes-executable "flake8")
;; (setq flymake-python-pyflakes-executable "pyflakespep8")

(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)
