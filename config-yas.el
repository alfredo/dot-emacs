;; yas config
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")

(require 'yasnippet)
(setq yas/snippet-dirs "~/.emacs.d/snippets")

(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt))

(yas/global-mode 1)