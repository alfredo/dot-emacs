(require 'url)

(defvar search-maxlen 50
  "Maximum string length of search term.")

(defun django-search (search-string)
  "Search on django.me."
  (interactive "sSearch for: ")
  (browse-url (concat "http://django.me/"
                      (url-hexify-string
                       (encode-coding-string search-string 'utf-8)))))

(defun django-search-selection ()
  "Create a django.me URL and send it to your web browser."
  (interactive)
  (let (start end term url)
    (if (or (not (fboundp 'region-exists-p)) (region-exists-p))
        (progn
          (setq start (region-beginning)
                end   (region-end))
          (if (> (- start end) search-maxlen)
              (setq term (buffer-substring start (+ start search-maxlen)))
            (setq term (buffer-substring start end)))
          (django-search term))
      (beep)
      (message "Region not active"))))

(provide 'django-search)


;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph
;; Takes a multi-line paragraph and makes it into a single line of text.
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))


;; Reload current file with position saved
;; http://www.thekidder.net/2008/10/21/emacs-reload-file/
(defun reload-file ()
  (interactive)
  (let ((curr-scroll (window-vscroll)))
    (find-file (buffer-name))
    (set-window-vscroll nil curr-scroll)
    (message "Reloaded file")))


;; Edit files as root
;; http://nflath.com/2009/08/tramp/
(defun sudo-edit (&optional arg)
  (interactive "p")
  (if arg
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun sudo-edit-current-file ()
  (interactive)
  (let ((pos (point)))
    (find-alternate-file
     (concat "/sudo:root@localhost:" (buffer-file-name (current-buffer))))
    (goto-char pos)))

(defun shell-current-directory ()
  "Opens a shell in the current directory"
  (interactive)
  (shell (concat "shell-" default-directory "-shell" )))

;; http://blog.tuxicity.se/elisp/emacs/2010/11/16/delete-file-and-buffer-in-emacs.html
(defun delete-this-buffer-and-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

;; http://www.reddit.com/r/emacs/comments/jfrqm/what_does_your_tab_key_do/
(defun smart-tab ()
  "If mark is active, indents region. Else if point is at the end of a symbol,
   expands it. Else indents the current line. Acts as normal in minibuffer."
  (interactive)
  (cond (mark-active (indent-region (region-beginning) (region-end)))
        ((and (looking-at "\\_>") (not (looking-at "end")))
         (hippie-expand nil))
        (t (indent-for-tab-command))))
