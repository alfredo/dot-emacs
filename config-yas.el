;; yas config
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/snippets")
(setq yas/prompt-functions '(yas/x-prompt))
