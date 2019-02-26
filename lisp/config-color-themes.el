;;; package --- color-themes
;;; Commentary:
;;; Code:
(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-eighties t)

(require 'spaceline-config)
(setq powerline-height 35)
(spaceline-emacs-theme)
(spaceline-helm-mode)
(spaceline-toggle-org-clock-off)
(spaceline-toggle-version-control-off)
(spaceline-toggle-projectile-root-on)
(spaceline-toggle-global-off)

(use-package spaceline-all-the-icons)
;; (require 'spaceline-all-the-icons)
;; (spaceline-all-the-icons-theme)
;; (spaceline-all-the-icons--setup-anzu)
(setq spaceline-all-the-icons-separator-type 'none)
(setq spaceline-all-the-icons-primary-separator "")
(setq spaceline-all-the-icons-secondary-separator "")
(setq spaceline-all-the-icons-clock-always-visible nil)
;; (setq spaceline-all-the-icons-flycheck-alternate t)
(spaceline-toggle-version-control-off)
(spaceline-toggle-all-the-icons-git-status-off)
(spaceline-toggle-all-the-icons-vc-icon-off)
(spaceline-toggle-all-the-icons-vc-status-off)
(setq spaceline-all-the-icons-hide-long-buffer-path t)

;; Prepare fonts
;; Output of emacs `describe-font`:
(setq source_code_pro "-*-Source Code Pro-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")
(setq ubuntu_mono "-*-Ubuntu Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")
(setq share-tech " -UKWN-Share Tech-normal-normal-normal-*-16-*-*-*-*-0-iso10646-1")
(add-to-list 'default-frame-alist '(font . "Iosevka-12"))

;; Make sure they are executed after the modes have been loaded:
(require 'diminish)
(setq diminish-list
      '(
        anzu-mode
        auto-revert-mode
        eldoc-mode
        global-whitespace-mode
        flycheck-mode
        helm-mode
        projectile-mode
        smartparens-mode
        super-save-mode
        volatile-highlights-mode
        yas-minor-mode
        ))
(dolist (mode diminish-list) (diminish mode))
(eval-after-load "company" '(diminish 'company-mode))

(put 'narrow-to-region 'disabled nil)
(provide 'config-color-themes)
