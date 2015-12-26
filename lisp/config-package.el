(require 'package)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(setq package-list '(
                     exec-path-from-shell  ;; Pick variables from user env
                     yasnippet
                     iy-go-to-char ;; Go to next character
                     flymake-cursor
                     flymake-python-pyflakes
                     flymake-jslint
                     flymake-sass
                     puppet-mode
                     s
                     revive
                     magit
                     mic-paren
                     nyan-mode
                     rainbow-mode
                     expand-region
                     browse-kill-ring
                     go-mode
                     sass-mode
                     scss-mode
                     fic-mode  ;; Fixme messages highlighted
                     moz-controller
                     projectile
                     goto-last-change
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
                     smartparens
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
