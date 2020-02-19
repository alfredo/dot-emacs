;;; package --- config-environment
;;; Commentary:
;;; Code:

(exec-path-from-shell-initialize)

(super-save-mode +1)
(setq super-save-auto-save-when-idle t)
(setq auto-save-default nil)

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
(setq whitespace-global-modes '(python-mode))

;; Colourful parenthesis
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(add-hook 'c-mode-common-hook
    (lambda ()
      (when (derived-mode-p 'python-mode)
  (ggtags-mode 1))))

(require 'volatile-highlights)
(setq volatile-highlights-mode t)

;; make ctrl-z undo
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)

(add-hook 'after-init-hook 'global-company-mode)

(require 'fic-mode)
(setq fic-mode 1)
(setq semantic-mode 1)

(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

(global-set-key (kbd "M-o") 'other-window)

(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-anzu-mode +1)

(require 'yasnippet)
(setq yas-snippet-dirs `(,
  (concat user-emacs-directory (convert-standard-filename "snippets"))))
(yas-global-mode 1)

(setq-default js2-basic-offset 2)
(setq js-indent-level 2)

(provide 'config-environment)
