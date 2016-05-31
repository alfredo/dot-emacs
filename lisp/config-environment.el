;; Use the current user shell.
(exec-path-from-shell-initialize)

;; Unique filenames for duplicate named buffers.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Remember the last place where I visited the file.
(require 'saveplace)
(setq-default save-place t)

;; Expand regions in semantical units
(require 'expand-region)
(global-set-key (kbd "C-c e") 'er/expand-region)

;; Do not show scratch at the begining
(setq inhibit-startup-message t)

;; Start up message
(setq initial-scratch-message "")

(setq default-directory "~/")

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
         (cons 'height (/ (- (x-display-pixel-height) 200)
                          (frame-char-height)))))))

(set-frame-size-according-to-resolution)

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
(add-to-list 'which-func-modes '(org-mode python-mode javscript-mode c++-mode))
(which-func-mode 1)

;; Treat camel-case words as single words
(subword-mode 1)

;; Enable puppet mode on .pp files
(setq auto-mode-alist (cons '("\\.pp$" . puppet-mode) auto-mode-alist))

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


(ns-set-resource nil "ApplePressAndHoldEnabled" "NO")

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
(global-whitespace-mode 1)

;; Go to next CHAR which is similar to "f" and "t" in vim
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-or-up-to-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-or-up-to-continue-backward)

;; Colourful parenthesis
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(add-hook 'c-mode-common-hook
    (lambda ()
      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode, 'python-mode)
  (ggtags-mode 1))))

(require 'volatile-highlights)
(volatile-highlights-mode t)

(global-undo-tree-mode)

(add-hook 'after-init-hook 'global-company-mode)

(defalias 'list-buffers 'ibuffer)

(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              (vc-status 16 16 :left)
              " "
              filename-and-process)))

(require 'fic-mode)
(fic-mode 1)

;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(semantic-mode 1)
