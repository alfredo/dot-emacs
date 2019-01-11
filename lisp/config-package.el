;;; package --- config-package
;;; Commentary:
;;; Code:


(require 'package)

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(setq package-list '(
    all-the-icons
    anzu
    arduino-mode
    browse-at-remote
    browse-kill-ring
    cider
    color-theme-sanityinc-tomorrow
    company
    company-jedi
    dash
    dash-functional
    deadgrep
    diff-hl
    diminish
    dockerfile-mode
    elixir-mode
    evil
    exec-path-from-shell
    expand-region
    fic-mode
    flx
    flycheck
    flycheck-haskell
    flycheck-inline
    forge
    ggtags
    god-mode
    grizzl
    haskell-mode
    helm
    helm-ag
    helm-flx
    helm-projectile
    helm-swoop
    ibuffer-vc
    iedit
    iy-go-to-char
    jedi-core
    json-mode
    magit
    mic-paren
    projectile
    rainbow-delimiters
    rainbow-mode
    rust-mode
    s
    sml-mode
    spaceline
    spaceline-all-the-icons
    string-inflection
    suggest
    super-save
    virtualenvwrapper
    volatile-highlights
    yaml-mode
    yapfify
    yasnippet
    use-package
    ))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

; activate all the packages (in particular autoloads)
(package-initialize)

(setq url-http-attempt-keepalives nil)

; fetch the list of packages available
(when (not package-archive-contents)
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))

(provide 'config-package)
