(setq projectile-indexing-method 'native)
(setq projectile-remember-window-configs t)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(setq projectile-globally-ignored-file-suffixes
      '(
        "pyc"
        ))

(projectile-global-mode)
(helm-projectile-on)
