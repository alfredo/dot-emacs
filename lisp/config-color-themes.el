(setq sml/no-confirm-load-theme t)
(setq sml/theme 'dark)
(sml/setup)

;;(require 'moe-theme)
;;(load-theme 'moe-dark t)
(require 'color-theme-sanityinc-tomorrow)
;; (color-theme-sanityinc-tomorrow-eighties)
(load-theme 'sanityinc-tomorrow-eighties t)


(require 'spaceline-config)
;; (spaceline-spacemacs-theme)
(spaceline-emacs-theme)
(spaceline-helm-mode)

(require 'spaceline-all-the-icons)

;; Prepare fonts
;; Output of emacs `describe-font`:
(setq source_code_pro "-*-Source Code Pro-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")
(setq ubuntu_mono "-*-Ubuntu Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")


(set-face-attribute 'default nil :font source_code_pro)
(let ((faces '(mode-line
               mode-line-buffer-id
               mode-line-emphasis
               mode-line-highlight
               mode-line-inactive)))
     (mapc
      (lambda (face) (set-face-attribute face nil :font ubuntu_mono))
      faces))

;; Make sure they are executed after the modes have been loaded:
(require 'diminish)
(setq diminish-list
      '(
        global-whitespace-mode
        volatile-highlights-mode
        smartparens-mode
        yas-minor-mode
        helm-mode
        projectile-mode
        undo-tree-mode
        flymake-mode
        ))
(dolist (mode diminish-list) (diminish mode))
(eval-after-load "company" '(diminish 'company-mode))

(set-face-attribute 'flymake-errline nil
                    :weight 'bold
                    :background nil)
(set-face-attribute 'flymake-warnline nil
                    :weight 'bold
                    :background nil)
(put 'narrow-to-region 'disabled nil)
