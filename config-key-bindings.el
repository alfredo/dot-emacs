;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Jump to a definition in the current file.
(global-set-key (kbd "C-c i") 'ido-imenu)

;; nom nom eat white space for next word
(global-set-key (kbd "M-s") 'fixup-whitespace)

(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c t") 'delete-trailing-whitespace)

(global-set-key (kbd "C-c o") 'occur)

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

;; alias to save the pinky
(global-set-key "\M-o" 'find-file)
(global-set-key "\M-s" 'save-buffer)
(global-set-key [(meta down)] 'end-of-buffer)
(global-set-key [(meta up)] 'beginning-of-buffer)
(global-set-key [(meta right)] 'end-of-line)
(global-set-key [(meta left)] 'beginning-of-line)

(defun fb ()
  "fix buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun fixfile ()
  "Fix a mac file list"
  (interactive)
  (set-buffer-file-coding-system 'utf-8-unix t)
  (flush-lines "^$")
  )


(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))