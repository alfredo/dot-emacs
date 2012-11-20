;; Use the current user shell.
(exec-path-from-shell-initialize)

;; Enable flymake for all files.
;; dissabled until this is fixed https://github.com/lunaryorn/flycheck/issues/11
;; (add-hook 'find-file-hook 'flycheck-mode)

;; Unique filenames for duplicate named buffers.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Remember the last place where I visited the file.
(require 'saveplace)
(setq-default save-place t)

;; Expand regions in semantical units
;; TODO: Use a more accessible key combination
;; (require 'expand-region)
;; (global-set-key (kbd "C-@") 'er/expand-region)

;; Do not show scratch at the begining
(setq inhibit-startup-message t)

;; Start up message
(setq initial-scratch-message "")

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

;; Remember the most used commands
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Provide access to the previous M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Only use y / n as a valid answer
(defalias 'yes-or-no-p 'y-or-n-p)

(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
     "python -mjson.tool" (current-buffer) t)))

;; chmod u+x files that have a shebang line
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; browse the kill ring
(browse-kill-ring-default-keybindings)

;; show current function
(require 'which-func)
(add-to-list 'which-func-modes '(org-mode python-mode))
(which-func-mode 1)

;; Treat camel-case words as single words
(subword-mode 1)
