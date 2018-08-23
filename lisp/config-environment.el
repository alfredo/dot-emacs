;; Use the current user shell.

(exec-path-from-shell-initialize)

;; enable auto supersave
(super-save-mode +1)
(setq super-save-auto-save-when-idle t)
(setq auto-save-default nil)


;; Unique filenames for duplicate named buffers.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Remember the last place where I visited the file.
(require 'saveplace)
(setq-default save-place t)

;; Expand regions in semantical units
(require 'expand-region)
(global-set-key (kbd "C-c e") 'er/expand-region)

(setq default-directory "~/")

;; Only use y / n as a valid answer
(defalias 'yes-or-no-p 'y-or-n-p)

(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; chmod u+x files that have a shebang line
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; browse the kill ring
(browse-kill-ring-default-keybindings)

;; show current function
(require 'which-func)
(which-func-mode 1)

;; Treat camel-case words as single words
(subword-mode 1)

;; only use spaces as tab
(setq-default indent-tabs-mode nil)
;; if a mode uses tabs only indent by 4. I am looking at you go.
(setq default-tab-width 4)
(custom-set-variables '(tab-width 4))

;; Vagrant files
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))


(defun kill-other-buffers ()
  "Kill all buffers but the current one.
Don't mess with special buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)) (not (buffer-file-name buffer)))
      (kill-buffer buffer))))


(defun narrow-to-region-indirect (start end)
  "Restrict editing in this buffer to the current region, indirectly."
  (interactive "r")
  (deactivate-mark)
  (let ((buf (clone-indirect-buffer nil nil)))
    (with-current-buffer buf
      (narrow-to-region start end))
      (switch-to-buffer buf)))

;; show whitespace
(require 'whitespace)
(setq whitespace-style '(trailing lines tab-mark))
(setq whitespace-line-column 80)
(global-whitespace-mode t)
(setq whitespace-global-modes '(python-mode))

;; Go to next CHAR which is similar to "f" and "t" in vim
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c b") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-or-up-to-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-or-up-to-continue-backward)
(global-set-key (kbd "C-z") 'zap-to-char)

;; Colourful parenthesis
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(add-hook 'c-mode-common-hook
    (lambda ()
      (when (derived-mode-p 'python-mode)
  (ggtags-mode 1))))

(require 'volatile-highlights)
(volatile-highlights-mode t)

;; make ctrl-z undo
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)

(add-hook 'after-init-hook 'global-company-mode)

(require 'fic-mode)
(fic-mode 1)

(semantic-mode 1)

(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(mapc (lambda (x)
        (add-to-list 'completion-ignored-extensions x))
      '(".aux" ".bbl" ".blg" ".exe"
        ".log" ".meta" ".out" ".pdf"
        ".synctex.gz" ".tdo" ".toc"
        "-pkg.el" "-autoloads.el"
        "Notes.bib" "auto/"))

(global-set-key (kbd "M-o") 'other-window)

(require 're-builder)
(setq reb-re-syntax 'string)

;; scroll one line at a time (less "jumpy" than defaults)
;; one line at a time
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
;; don't accelerate scrolling
(setq mouse-wheel-progressive-speed nil)
;; scroll window under mouse
(setq mouse-wheel-follow-mouse 't)
;; keyboard scroll one line at a time
(setq scroll-step 1)

(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

(provide 'config-environment)

(global-anzu-mode +1)
