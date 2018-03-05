;;; package --- defaults
;;; Commentary:
;;; Code:

;; Custom configuration of projectile
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
        ".idea"
        ".ensime_cache"
        ".eunit"
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
(projectile-global-mode)
(helm-projectile-on)

(provide 'config-projectile)
