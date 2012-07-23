;;  toolbars removal
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq fill-column 70)
(column-number-mode 1)
(show-paren-mode t)
(global-font-lock-mode 1)
;; make selected area visible
(setq transient-mark-mode t)


; never use tabs
(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)
;;(setq whitespace-trailing 'underline)

;; unicode
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

; Load directories
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/plugins")

;; environment setup
(load-library "config-environment")
;; ; key bindings
(load-library "config-key-bindings")
;; ido config
(load-library "config-ido")
;; yas config
(load-library "config-yas")
;; themes
(load-library "config-color-themes")
;; html config
(load-library "config-markup")
;; css config
(load-library "config-css")
;; javascript config
(load-library "config-javascript")
;; python mode
(load-library "config-python-mode")
;; shell
(load-library "config-shell")
;; custom setup
(load-library "config-custom")
(put 'ido-exit-minibuffer 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
