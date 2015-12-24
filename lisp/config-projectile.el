(projectile-global-mode)

(setq projectile-indexing-method 'native)
(setq projectile-remember-window-configs t)
(setq projectile-enable-caching t)


(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
