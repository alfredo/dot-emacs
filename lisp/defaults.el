;;; package --- defaults
;;; Commentary:
;;; Code:

;;  toolbars removal.
(tool-bar-mode -1)
(menu-bar-mode 0)
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq fill-column 80)
(column-number-mode 1)
(global-font-lock-mode 1)

; never use tabs.
(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; kill ring:
(setq
 global-mark-ring-max 99
 mark-ring-max 99
 ; if NIL, kill whole line and move the next line up
 kill-whole-line t
 mode-require-final-newline t
 )

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
      (append '((extended-command-history . 50)
                (file-name-history        . 200)
                (grep-history             . 100)
                (compile-history          . 100)
                (minibuffer-history       . 50)
                (query-replace-history    . 60)
                (read-expression-history  . 60)
                (regexp-history           . 60)
                (regexp-search-ring       . 20)
                (search-ring              . 20)
                (shell-command-history    . 50)
                tags-file-name
                register-alist)))


;; mark current line.
(global-hl-line-mode 1)

;; scroll configuration.
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

;; Overwrite any selected region with new text
(delete-selection-mode 1)
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
