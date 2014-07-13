
;; (color-theme-tomorrow-night-eighties)

(require 'color-theme-sanityinc-solarized)

;; (require 'nyan-mode)
;; (add-hook 'text-mode-hook (lambda () (nyan-mode t)))
;; (add-hook 'python-mode-hook (lambda () (nyan-mode t)))

(defvar mode-line-cleaner-alist
  `((auto-complete-mode . " α")
    (yas-minor-mode . " ✂")
    (eldoc-mode . "")
    (abbrev-mode . "")
    ;; Major modes
    (lisp-interaction-mode . "i")
    (hi-lock-mode . "")
    (python-mode . "Py")
    (emacs-lisp-mode . "EL"))
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")

(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                 (mode-str (cdr cleaner))
                 (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
                 (setcar old-mode-str mode-str))
               ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)
