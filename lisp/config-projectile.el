;;; package --- config-projectile
;;; Commentary:
;;; Code:

(setq projectile-indexing-method 'alien)
(setq projectile-remember-window-configs t)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(setq projectile-globally-ignored-file-suffixes
      '(
        ".pyc"
        ".DS_Store"
        ".cache"
        ".min.js"
        ".dist-info"
        ".so"
        ".ttf"
        ".jpg"
        ".gif"
        ".mpg"
        ".mov"
        ".zip"
        ".dump"
        ))
(setq projectile-globally-ignored-directories
      '(
        ".git"
        ".hg"
        ".fslckout"
        "_FOSSIL_"
        ".bzr"
        "_darcs"
        ".tox"
        ".svn"
        ".stack-work"
        "migrations"
        ))
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(projectile-global-mode)
(helm-projectile-on)

(provide 'config-projectile)
