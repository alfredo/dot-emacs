(require 'package)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(setq package-list '(
    exec-path-from-shell
    yasnippet
    iy-go-to-char
    flymake-cursor
    flymake-python-pyflakes
    flymake-jslint
    flymake-sass
    puppet-mode
    s
    revive
    magit
    mic-paren
    rainbow-mode
    expand-region
    browse-kill-ring
    go-mode
    sass-mode
    scss-mode
    fic-mode
    json-reformat
    dash
    dash-functional
    moe-theme
    js2-mode
    arduino-mode
    git-timemachine
    rainbow-delimiters
    dockerfile-mode
    terraform-mode
    projectile
    ggtags
    helm
    helm-projectile
    helm-swoop
    smart-mode-line
    volatile-highlights
    clean-aindent-mode
    undo-tree
    jedi-core
    company
    company-jedi
    ibuffer-vc
    diminish
    ;; haskell-mode
    ;; flycheck-haskell
    ;; company-ghci
    yaml-mode
    elm-mode
    elixir-mode
    evil
    web-mode
    cider
    flycheck
    json-mode
    rust-mode
    nyan-mode
    browse-at-remote
    py-yapf
    suggest
    iedit
    spaceline
    spaceline-all-the-icons
    virtualenvwrapper
    color-theme-sanityinc-tomorrow
    all-the-icons
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
