;;; package --- defaults
;;; Commentary:
;;; Code:

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
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-<tab>") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(setq helm-ff-skip-boring-files t)
(setq helm-boring-file-regexp-list
      '(
        "\\.git$"
        "\\.hg$"
        "\\.svn$"
        "\\.CVS$"
        "~$"
        "\\.elc$"
        "\\.pyc$"
        "\\.pyo$"
        "\\.DS_Store$"
        "\\.cache$"
        "\\.vagrant$"
        "\\.sass-cache$"
        "\\node_modules$"
        "\\egg.info$"
        "\\GPATH$"
        "\\GRTAGS$"
        "\\GTAGS$"
        "\\auto-save-list$"
        ))

(setq helm-boring-buffer-regexp-list
      '(
        "\\` "
        "\\*helm"
        "\\*helm-mode"
        "\\*Echo Area"
        "\\*tramp"
        "\\*Minibuf"
        "\\*epc"
    ))

(setq
 helm-mode-fuzzy-match t
 ; open helm buffer inside current window, not occupy whole other window
 helm-split-window-in-side-p t
 ; move to end or beginning of source when reaching top or bottom of source.
 helm-move-to-line-cycle-in-source t
 ; search for library in `require' and `declare-function' sexp.
 helm-ff-search-library-in-sexp t
 ; scroll 8 lines other window using M-<next>/M-<prior>
 helm-scroll-amount 8
 helm-ff-file-name-history-use-recentf t
 helm-M-x-fuzzy-match t
 helm-buffers-fuzzy-matching t
 helm-recentf-fuzzy-match t
 helm-semantic-fuzzy-match t
 helm-imenu-fuzzy-match t
 helm-locate-fuzzy-match t
 )

(helm-mode 1)

(setq projectile-completion-system 'helm)
(helm-projectile-on)

 (provide 'config-helm)
