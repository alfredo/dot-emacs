;;  toolbars removal.
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq fill-column 70)
(column-number-mode 1)
(show-paren-mode t)
(global-font-lock-mode 1)

;; make selected area visible.
(setq transient-mark-mode t)

; never use tabs.
(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)

;; unicode.
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; no ring bell.
(setq ring-bell-function 'ignore)

;; desktop mode
(desktop-save-mode 1)
(setq desktop-buffers-not-to-save
        (concat "\\("
                "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS\\|.DS_Store"
                "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb";
                "\\)$"))
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
(setq desktop-globals-to-save
      (append '((extended-command-history . 30)
                (file-name-history        . 100)
                (grep-history             . 30)
                (compile-history          . 30)
                (minibuffer-history       . 50)
                (query-replace-history    . 60)
                (read-expression-history  . 60)
                (regexp-history           . 60)
                (regexp-search-ring       . 20)
                (search-ring              . 20)
                (shell-command-history    . 50)
                tags-file-name
                register-alist)))

;; backup files.
(setq version-control t)
(setq delete-old-versions 1)
(setq kept-new-versions 6)
(setq kept-old-versions 6)
(setq backup-by-copying t)
(add-hook 'before-save-hook
          '(lambda ()
	     (setq buffer-backed-up nil)))
;; backup directory.
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; mark current line.
(global-hl-line-mode 1)

;; enable change to uppercase.
(put 'upcase-region 'disabled nil)

;; scroll configuration.
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) 
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't) 
(setq scroll-step 1)

;; grep configuration.
(custom-set-variables '(grep-program "ack -H -a --nogroup"))

;; Overwrite any selected region with new text
(delete-selection-mode 1)

