(setq sml/no-confirm-load-theme t)
(setq sml/theme 'dark)
(sml/setup)

(require 'moe-theme)
(load-theme 'moe-dark t)

;; Prepare fonts
(setq source_code_pro "-apple-Source_Code_Pro-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")
(setq ubuntu_mono "-apple-Ubuntu_Mono-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1 Mono-7")


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
                    :underline '(:color "red" :style wave)
                    :weight 'bold
                    :background nil)
(set-face-attribute 'flymake-warnline nil
                    :underline '(:color "yellow" :style wave)
                    :weight 'bold
                    :background nil)
(put 'narrow-to-region 'disabled nil)
