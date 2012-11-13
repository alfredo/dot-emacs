(require 'package)
(require 'melpa)

(setq package-list '(exec-path-from-shell flycheck flymake-easy flymake-cursor python dropdown-list flyspell
	expand-region smex yasnippet color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cyberpunk-theme
	php-mode sass-mode js2-mode flymake-jslint coffee-mode bash-completion mic-paren puppet-mode magit
	auto-complete ctags fixmee flex-isearch gist goto-chg logito ido-ubiquitous bm browse-kill-ring groovy-mode
	iedit python-magic redo+ restclient))

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
