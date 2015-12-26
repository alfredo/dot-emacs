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
