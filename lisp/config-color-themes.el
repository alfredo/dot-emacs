;;; package --- color-themes
;;; Commentary:
;;; Code:

;; Prepare fonts
;; Output of emacs `describe-font`:
(setq source_code_pro "-*-Source Code Pro-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")
(setq ubuntu_mono "-*-Ubuntu Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")
(setq share-tech " -UKWN-Share Tech-normal-normal-normal-*-16-*-*-*-*-0-iso10646-1")
(add-to-list 'default-frame-alist '(font . "Iosevka-14"))

;; Install and configure all-the-icons
(use-package all-the-icons
  :if (display-graphic-p)
  :config
  ;; Run this once after installation: M-x all-the-icons-install-fonts
  )

;; Configure doom-themes without neotree/treemacs parts
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-bluloco-dark t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; Configure doom-modeline with all-the-icons
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-bar-width 5)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-buffer-state-icon t)
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-minor-modes nil)
  (doom-modeline-enable-word-count nil)
  (doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))
  (doom-modeline-indent-info nil))

;; Configure dashboard with all-the-icons
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-startup-banner 'logo)
  (dashboard-center-content t)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-items '((recents  . 5)
                     (bookmarks . 5)
                     (projects . 5))))



(put 'narrow-to-region 'disabled nil)


(require 'delight)

(delight 'abbrev-mode " Abv" "abbrev")

(delight '((abbrev-mode " Abv" "abbrev")
           (smart-tab-mode " \\t" "smart-tab")
           (eldoc-mode nil "eldoc")
           (rainbow-mode)
           (overwrite-mode " Ov" t)
           (emacs-lisp-mode "Elisp" :major)))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))


(use-package corfu
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :custom
  ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))


;; Enable auto-save-visited-mode globally
(auto-save-visited-mode +1)

;; Optional: Configure how often files are saved (in seconds)
(setq auto-save-visited-interval 5) ;; Save every 5 seconds when idle

;; use-package with package.el:
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))


;; Basic completion framework
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Improved candidate filtering
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Rich annotations in the minibuffer
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;; Useful search and navigation commands
(use-package consult
  :ensure t
  :bind (("C-l" . consult-line)
         ("C-x b" . consult-buffer)
         ("M-y" . consult-yank-pop)
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)))

;; Optional: Enhanced completion UI
(use-package embark
  :ensure t
  :bind (("C-." . embark-act)))

;; Optional: Embark + Consult integration
(use-package embark-consult
  :ensure t
  :after (embark consult))

(require 'highlight-parentheses)
(add-hook 'minibuffer-setup-hook #'highlight-parentheses-minibuffer-setup)
