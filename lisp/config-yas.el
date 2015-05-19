;; yas config
(require 'yasnippet)
(setq yas-snippet-dirs `(,(concat user-emacs-directory (convert-standard-filename "snippets"))))
(setq yas/prompt-functions '(yas/ido-prompt))
(yas-global-mode 1)
