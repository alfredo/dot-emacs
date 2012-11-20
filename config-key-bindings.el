;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; Use regex searches by default.
;; (global-set-key (kbd "C-s") 'isearch-forward-regexp)
;; (global-set-key (kbd "\C-r") 'isearch-backward-regexp)
;; (global-set-key (kbd "C-M-s") 'isearch-forward)
;; (global-set-key (kbd "C-M-r") 'isearch-backward)

;; Jump to a definition in the current file.
(global-set-key (kbd "C-c i") 'ido-imenu)

;; nom nom eat white space for next word
(global-set-key (kbd "M-s") 'fixup-whitespace)

(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c t") 'delete-trailing-whitespace)

(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-c g") 'goto-line)

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

(defun rename-file-and-buffer ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond ((get-buffer new-name)
               (message "A buffer named '%s' already exists!" new-name))
              (t
               (rename-file name new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)))))))

(global-set-key (kbd "C-c r") 'rename-file-and-buffer)

;; Alias to save the pinky
(global-set-key [(meta down)] 'end-of-buffer)
(global-set-key [(meta up)] 'beginning-of-buffer)
(global-set-key [(meta right)] 'end-of-line)
(global-set-key [(meta left)] 'beginning-of-line)

(defun fix-buffer ()
  "Remove trailing whitespace, reindent and tab the buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun clean-and-ut8fy ()
  "Remove empty lines and change encoding to utf8"
  (interactive)
  (set-buffer-file-coding-system 'utf-8-unix t)
  (flush-lines "^$")
  )

;; Shortucts by pressing two keys at the same time
(require 'iy-go-to-char)
(require 'key-chord)
(key-chord-mode 1)
;; Expand function.
(key-chord-define-global "jk" 'dabbrev-expand)
;; Go to next given character.
(key-chord-define-global "df" 'iy-go-to-char)
(key-chord-define-global "ds" 'iy-go-to-char-backward)
;; Go to line number.
(key-chord-define-global "cv" 'goto-line)
;; bookmarks
(key-chord-define-global "kl" 'bm-toggle)
(key-chord-define-global "l;" 'bm-next)

;; expand in semantical units
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
