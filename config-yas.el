;; yas config
(setq yas/snippet-dirs (concat user-emacs-directory
                       (convert-standard-filename "plugins/")))
(setq yas/prompt-functions '(yas/dropdown-prompt))
(yas-global-mode)
