(require 'package)
(require 'melpa)

(setq package-list '(exec-path-from-shell smex yasnippet dropdown-list color-theme-sanityinc-tomorrow
	color-theme-sanityinc-solarized iy-go-to-char key-chord python flymake-cursor flymake-python-pyflakes
	bm restclient flymake-jslint flymake-sass flymake-ruby puppet-mode s revive nyan-mode magit mic-paren
	rainbow-mode expand-region browse-kill-ring gist))

;; TODO: missing rainbow-mode

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
