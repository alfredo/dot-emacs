;;; package --- config-package
;;; Commentary:
;;; Code:
(require 'package)

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)


(setq package-list '(
    all-the-icons
    browse-at-remote
    doom-themes
    corfu
    delight
    exec-path-from-shell
    expand-region
    forge
    ibuffer-vc
    magit
    ;; mic-paren
    highlight-parentheses
    projectile
    rainbow-delimiters
    rainbow-mode
    doom-modeline
    string-inflection
    yasnippet
    use-package
    dashboard
    vertico
    consult
    orderless
    marginalia
    embark
    embark-consult
    eglot
    tree-sitter
    format-all
    which-key
    helpful
    org-roam
    vterm
    yaml-mode
    go-mode
    ))

;; Install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)  ;; Always ensure packages are installed



(setq url-http-attempt-keepalives nil)

; fetch the list of packages available
(when (not package-archive-contents)
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))

(provide 'local-packages)
