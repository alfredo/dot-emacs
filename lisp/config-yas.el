;;; package --- defaults
;;; Commentary:
;;; Code:

;; yas config
(require 'yasnippet)
(setq yas-snippet-dirs `(,
  (concat user-emacs-directory (convert-standard-filename "snippets"))))
(yas-global-mode 1)

(provide 'config-yas)
