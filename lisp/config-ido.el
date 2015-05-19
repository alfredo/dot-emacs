;; ido
(require 'ido)
(require 'flx-ido)

(projectile-global-mode)
(ido-mode t)
(flx-ido-mode 1)

(setq
 ido-ignore-buffers ;; ignore these guys
 '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido"
   "^\\*tramp" "^\\*Messages\\*" " output\\*$")
 ido-everywhere t                 ; use for many file dialogs
 ido-case-fold  t                 ; be case-insensitive
 ido-enable-last-directory-history t ; remember last used dirs
 ido-max-prospects 0              ; don't spam my minibuffer
 )

;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(setq projectile-indexing-method 'native)
(setq projectile-remember-window-configs t)
