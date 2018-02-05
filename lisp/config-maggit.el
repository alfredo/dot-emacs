;; Silent magit instructions:
(setq magit-last-seen-setup-instructions "1.4.0")
(setq magit-push-always-verify nil)
(define-key global-map (kbd "C--") 'magit-status)

(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
