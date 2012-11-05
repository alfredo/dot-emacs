;; emacs environment config
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(require 'saveplace)
(setq-default save-place t)

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
;; vagrantfile is like ruby
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

;; smex. List the most used emacs commands.
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(put 'upcase-region 'disabled nil) ;;  Change to uppercase text

(setq font-lock-global-modes '(not rst-mode))

(defvar page-break-face 'bold)
(defvar page-break-string-char ?-)

(defun page-break-display-table (window)
  "Create a display-table that displays page-breaks prettily."
  (let ((table (or (copy-sequence (window-display-table window))
                   (make-display-table))))
    (aset table ?\^L
          (let ((face-offset (lsh (face-id page-break-face) 19)))
            (vconcat (mapcar (lambda (c) (+ face-offset c)) 
           (make-string (1- (window-width window))
            page-break-string-char)))))
    table))


(defun page-break-mode-hook-function  ()
  "Function called for updating display table"
  (mapcar (lambda (window) 
      (set-window-display-table window 
              (page-break-display-table window)))
    (window-list nil 'no-minibuffer)))

(define-minor-mode page-break-mode
  "Toggle Page Break mode.

In Page Break mode, page breaks (^L characters) are displayed as a
horizontal line of `page-break-string-char' characters."
  :global t 
  :lighter " Pgbrk" 
  (if page-break-mode
      (add-hook 'window-configuration-change-hook 
    'page-break-mode-hook-function )
    (remove-hook 'window-configuration-change-hook 
     'page-break-mode-hook-function)))

(defun turn-on-page-break-mode ()
  (page-break-mode 1))

(defun turn-off-page-break-mode ()
  (page-break-mode -1))

(turn-on-page-break-mode)

;; Enable flymake for all files
(add-hook 'find-file-hook 'flycheck-mode)
