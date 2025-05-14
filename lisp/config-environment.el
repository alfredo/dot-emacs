;;; package --- config-environment
;;; Commentary:
;;; Code:

(exec-path-from-shell-initialize)

(delete-selection-mode 1)

;; Unique filenames for duplicate named buffers.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Remember the last place where I visited the file.
(require 'saveplace)
(setq-default save-place t)

(setq default-directory "~/")

;; Only use y / n as a valid answer
(defalias 'yes-or-no-p 'y-or-n-p)

(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; chmod u+x files that have a shebang line
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; browse the kill ring
(browse-kill-ring-default-keybindings)

;; show current function
(require 'which-func)
(setq which-func-mode 1)

;; Treat camel-case words as single words
(setq subword-mode 1)

;; only use spaces as tab
(setq-default indent-tabs-mode nil)
;; if a mode uses tabs only indent by 4. I am looking at you go.
(setq default-tab-width 4)
(custom-set-variables '(tab-width 4))

;; show whitespace
(require 'whitespace)
(setq whitespace-style '(trailing lines tab-mark))
(setq whitespace-line-column 80)
(global-whitespace-mode t)

;; Colourful parenthesis
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; make ctrl-z undo
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)


(add-hook 'after-init-hook 'global-corfu-mode)

(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

(global-set-key (kbd "M-o") 'other-window)

(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

(require 'yasnippet)
(setq yas-snippet-dirs `(,
  (concat user-emacs-directory (convert-standard-filename "snippets"))))
(yas-global-mode 1)

(use-package vterm
  :ensure t
  :config
  (setq vterm-shell "/bin/zsh")
  ;; Disable whitespace-mode in vterm buffers
  (add-hook 'vterm-mode-hook (lambda () (whitespace-mode 0)))
  ;; Create a key binding to open vterm
  (global-set-key (kbd "C-c t") 'vterm))

;; Disable whitespace-mode in vterm
(defun my-vterm-hook ()
  "Disable whitespace mode in vterm buffers"
  (whitespace-mode -1))

(add-hook 'vterm-mode-hook (lambda ()
                             (setq-local show-trailing-whitespace nil)
                             (whitespace-mode -1)))

;; Optional: create a key binding to open vterm
(global-set-key (kbd "C-c t") 'vterm)

(provide 'config-environment)
