(require 'package)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(setq package-list '(
   use-package
    sml-mode
    exec-path-from-shell
    yasnippet
    iy-go-to-char
    flymake-cursor
    flymake-python-pyflakes
    s
    magit
    mic-paren
    rainbow-mode
    expand-region
    browse-kill-ring
    fic-mode
    json-reformat
    dash
    dash-functional
    moe-theme
    arduino-mode
    git-timemachine
    rainbow-delimiters
    dockerfile-mode
    projectile
    ggtags
    helm
    helm-projectile
    helm-swoop
    volatile-highlights
    clean-aindent-mode
    undo-tree
    jedi-core
    company
    company-jedi
    ibuffer-vc
    diminish
    yaml-mode
    elixir-mode
    evil
    cider
    flycheck
    json-mode
    rust-mode
    browse-at-remote
    suggest
    iedit
    spaceline
    spaceline-all-the-icons
    virtualenvwrapper
    color-theme-sanityinc-tomorrow
    all-the-icons
    super-save
    grizzl
    flx
    helm-flx
    yapfify
    diff-hl
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
