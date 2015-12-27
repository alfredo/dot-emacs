(require 'helm)
(require 'helm-config)

; rebind tab to run persistent action
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

;; Make backward keystroke behave like ido in helm
(defun fu/helm-find-files-navigate-back (orig-fun &rest args)
  (if (= (length helm-pattern) (length (helm-find-files-initial-input)))
      (helm-find-files-up-one-level 1)
    (apply orig-fun args)))
(advice-add 'helm-ff-delete-char-backward :around #'fu/helm-find-files-navigate-back)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
; make TAB works in terminal
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-ff-skip-boring-files t)
(setq helm-boring-file-regexp-list
  '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "~$"
    "\\.elc$" "\\.pyc$" "\\.pyo$"))
(setq helm-boring-buffer-regexp-list
  '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*tramp" "\\*Minibuf"))

(setq
 ; open helm buffer inside current window, not occupy whole other window
 helm-split-window-in-side-p t
 ; move to end or beginning of source when reaching top or bottom of source.
 helm-move-to-line-cycle-in-source t
 ; search for library in `require' and `declare-function' sexp.
 helm-ff-search-library-in-sexp t
 ; scroll 8 lines other window using M-<next>/M-<prior>
 helm-scroll-amount 8
 helm-ff-file-name-history-use-recentf t
 )

(helm-mode 1)

(setq projectile-completion-system 'helm)
(helm-projectile-on)
