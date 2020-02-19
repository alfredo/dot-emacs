;;; package --- config-package
;;; Commentary:
;;; Code:
(require 'package)

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(setq package-list '(
    all-the-icons
    browse-at-remote
    browse-kill-ring
    color-theme-sanityinc-tomorrow
    company
    company-go
    company-jedi
    deadgrep
    diminish
    dockerfile-mode
    exec-path-from-shell
    expand-region
    flycheck
    flycheck-golangci-lint
    flycheck-inline
    forge
    ggtags
    go-mode
    golint
    helm
    helm-ag
    helm-flx
    helm-projectile
    helm-swoop
    ibuffer-vc
    jedi-core
    json-mode
    json-reformat
    magit
    mic-paren
    projectile
    rainbow-delimiters
    rainbow-mode
    rust-mode
    spaceline
    spaceline-all-the-icons
    string-inflection
    super-save
    terraform-mode
    virtualenvwrapper
    yapfify
    yasnippet
    use-package
    python-black
    ))

(package-initialize)

(setq url-http-attempt-keepalives nil)

; fetch the list of packages available
(when (not package-archive-contents)
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))

(provide 'local-packages)
