;; emacs environment config
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(require 'saveplace)
(setq-default save-place t)

;; Show recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 500)
(setq recentf-max-menu-items 60)
(global-set-key [(meta f12)] 'recentf-open-files)
;; ido to select from recent files
(defun xsteve-ido-choose-from-recentf ()
  "Use ido to select a recently opened file from the `recentf-list'"
  (interactive)
  (let ((home (expand-file-name (getenv "HOME"))))
    (find-file
     (ido-completing-read "Recent open: "
                          (mapcar (lambda (path)
                                    (replace-regexp-in-string home "~" path))
                                  recentf-list)
                          nil t))))
(global-set-key [(meta f11)] 'xsteve-ido-choose-from-recentf)

;; desktop mode
(desktop-save-mode 1)
(setq desktop-buffers-not-to-save
        (concat "\\("
                "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS\\|.DS_Store"
                "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb";
                "\\)$"))
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
(setq desktop-globals-to-save
      (append '((extended-command-history . 30)
                (file-name-history        . 100)
                (grep-history             . 30)
                (compile-history          . 30)
                (minibuffer-history       . 50)
                (query-replace-history    . 60)
                (read-expression-history  . 60)
                (regexp-history           . 60)
                (regexp-search-ring       . 20)
                (search-ring              . 20)
                (shell-command-history    . 50)
                tags-file-name
                register-alist)))

(require 'pastebin)

;; back up files
(setq version-control t)
(setq delete-old-versions 1)
(setq kept-new-versions 10)
(setq kept-old-versions 10)
(setq backup-by-copying t)
(add-hook 'before-save-hook
          '(lambda ()
	     (setq buffer-backed-up nil)))
;; backup directory
(setq backup-directory-alist
      '(("." . "~/.emacs.d/.backups")))

(require 'psvn)

(require 'mic-paren)
(paren-activate)

(require 'nyan-mode)
(add-hook 'text-mode-hook (lambda () (nyan-mode t)))
(add-hook 'python-mode-hook (lambda () (nyan-mode t)))

(require 'fixme-mode)
(add-hook 'text-mode-hook (lambda () (fixme-mode t)))

(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(require 'magit)
;; vagrantvile is like ruby
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; ring bell
(setq ring-bell-function 'ignore)

;; ack
(custom-set-variables '(grep-program "ack -H -a --nogroup"))

;; yas config
(add-to-list 'load-path
             "~/.emacs.d/plugins/expand-region")

(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)
(delete-selection-mode 1)

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 170))
           (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist 
         (cons 'height (/ (- (x-display-pixel-height) 80)
                             (frame-char-height)))))))

(set-frame-size-according-to-resolution)

(global-hl-line-mode 1)
(set-face-background 'hl-line "#002b36")  ;; Emacs 22 Only
;(set-face-background 'highlight "#330")  ;; Emacs 21 Only