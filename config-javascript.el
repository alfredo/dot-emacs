;; ;; javascript config


(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
;;(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

(when (load "flymake" t)
  (defun flymake-closure-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "closure.sh" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.js\\'" flymake-closure-init)))

(add-hook 'espresso-mode-hook
	  (lambda () (flymake-mode t)))

;; coffee-script heh

(add-to-list 'load-path "~/.emacs.d/plugins/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
;; idiomatic CoffeeScript uses two spaces
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;; http://closure-compiler.googlecode.com/files/compiler-latest.zip

;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; (defun my-js2-indent-function ()
;;   (interactive)
;;   (save-restriction
;;     (widen)
;;     (let* ((inhibit-point-motion-hooks t)
;;            (parse-status (save-excursion (syntax-ppss (point-at-bol))))
;;            (offset (- (current-column) (current-indentation)))
;;            (indentation (espresso--proper-indentation parse-status))
;;            node)

;;       (save-excursion

;;         ;; I like to indent case and labels to half of the tab width
;;         (back-to-indentation)
;;         (if (looking-at "case\\s-")
;;             (setq indentation (+ indentation (/ espresso-indent-level 2))))

;;         ;; consecutive declarations in a var statement are nice if
;;         ;; properly aligned, i.e:
;;         ;;
;;         ;; var foo = "bar",
;;         ;;     bar = "foo";
;;         (setq node (js2-node-at-point))
;;         (when (and node
;;                    (= js2-NAME (js2-node-type node))
;;                    (= js2-VAR (js2-node-type (js2-node-parent node))))
;;           (setq indentation (+ 4 indentation))))

;;       (indent-line-to indentation)
;;       (when (> offset 0) (forward-char offset)))))

;; ;; js expresso
;; (autoload #'espresso-mode "espresso" "Start espresso-mode" t)
;; (add-to-list 'auto-mode-alist '("\.js$" . espresso-mode))
;; (add-to-list 'auto-mode-alist '("\.json$" . espresso-mode))

(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
     "python -mjson.tool" (current-buffer) t)))
