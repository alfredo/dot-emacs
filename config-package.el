(require 'package)
(require 'melpa)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(setq url-http-attempt-keepalives nil)

(mapc
 (lambda (package)
   (or (package-installed-p package)
       (if (y-or-n-p (format "Package %s is missing. Install it? " package)) 
           (package-install package))))
 '(exec-path-from-shell flycheck flymake-easy flymake-python-pyflakes flymake-css flymake-cursor 
 	flymake-php flymake-ruby flymake-sass flymake-shell flyspell-lazy full-ack dired+ 
 	magit rainbow-mode flex-isearch python yasnippet multi-web-mode bookmark+ 
 	browse-kill-ring color-theme-solarized csv-mode ctags ctags-update
 	dropdown-list duplicate-thing expand-region gist goto-chg
 	groovy-mode hippie-namespace ido-ubiquitous markdown-mode mark-multiple
 	markdown-mode+ mic-paren mode-line-debug molokai-theme monky multifiles
 	multiple-cursors prelude-python prelude-ruby puppet-mode redo+ restclient
 	revive sass-mode shell-here smart-mode-line smex flyspell))
