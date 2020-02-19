;; first setup a key-bind to access org-agenda, we'll talk more about what this is in a moment
(global-set-key (kbd "C-c a") 'org-agenda)
;; next setup a key-bind to enable you to quickly capture ideas
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-todo-keywords '("TODO" "STARTED" "BUG" "QUESTION" "DONE" "CANCELLED"))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
        ("STARTED" . "yellow")
        ("BUG" . "red")
        ("QUESTION" . (:foreground "yellow" :weight bold))
        ("CANCELLED" . (:foreground "red" :weight bold))
        ("DONE" . "green")
        ))

(defvar org-agenda-include-diary t)

(defvar org-src-fontify-natively t)

(setq org-agenda-files (directory-files-recursively "~/org/agenda" "org$"))

(setq org-default-notes-file "~/org/agenda/organizer.org")

(provide 'config-org)
