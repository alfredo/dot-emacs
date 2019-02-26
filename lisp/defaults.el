;;; package --- defaults
;;; Commentary:
;;; Code:

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq fill-column 80)
(setq column-number-mode t)
(setq global-font-lock-mode t)

; never use tabs.
(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)

; No backup~ files:
(setq make-backup-files nil)
; No #autosave# files
(setq auto-save-default nil)

(setq global-mark-ring-max 999)
(setq mark-ring-max 999)
(setq kill-whole-line t)
(setq mode-require-final-newline t)

(setq ring-bell-function 'ignore)

;; desktop mode
(desktop-save-mode 1)
(setq desktop-buffers-not-to-save
        (concat "\\("
                "\\.log\\|(ftp)\\|^tags\\|^TAGS\\|.DS_Store\\|\\.emacs.*\\)$"))
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
(setq desktop-save-mode t)

(setq desktop-globals-to-save
      (append '((extended-command-history . 100)
                (file-name-history        . 900)
                (grep-history             . 100)
                (compile-history          . 100)
                (minibuffer-history       . 100)
                (query-replace-history    . 100)
                (read-expression-history  . 100)
                (regexp-history           . 100)
                (regexp-search-ring       . 100)
                (search-ring              . 100)
                (shell-command-history    . 100)
                tags-file-name
                register-alist)))


;; mark current line.
(setq global-hl-line-mode t)

;; scroll configuration.
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)

;; Overwrite any selected region with new text
(setq delete-selection-mode t)
(setq word-wrap t)

;; favour utf-8 encoding:
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq auto-window-vscroll nil)

(setq mac-option-key-is-meta t)
(setq mac-option-modifier 'meta)

(provide 'defaults)
