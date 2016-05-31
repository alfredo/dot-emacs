(setq projectile-indexing-method 'native)
(setq projectile-remember-window-configs t)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(setq projectile-globally-ignored-file-suffixes
      '(
        "pyc"
        ))

(projectile-global-mode)
(helm-projectile-on)


(defun get-parent-dir (directory)
  ;; Returns the parent directory of the path given
  (directory-file-name (file-name-directory directory))
  )

(defun has-test-dir (directory)
  ;; Test if directory has a `tests` directory:
  (file-accessible-directory-p (concat directory "/tests"))
  )

(defun is-end-leaf-dir (directory)
  ;; Root directory or projectile root:
  (or
   (equal directory "/")
   (equal directory projectile-project-root)
   (equal directory (getenv "HOME"))
   )
  )

(defun replace-in-string (what with in)
  ;; String replacement
  (replace-regexp-in-string (regexp-quote what) with in nil 'literal))


(defun get-test-file-name (current-dir buffer-file-name)
  ;; Extracts the file test from the path and buffer name
  (setq test-file-name
        (replace-in-string current-dir "" buffer-file-name))
  (replace-regexp-in-string "^/[[:ascii:]]+?/" "" test-file-name nil 'literal)
  )

(defun create-test-file (test-file-name)
  ;; Creates the given test-file-name and its containing dir:
  (setq test-dir (file-name-directory test-file-name))
  (setq init-file (concat test-dir "__init__.py"))
  (if (not (file-exists-p init-file))
      (
       (make-directory test-dir)
       (write-file init-file)
       )
    )
  (find-file test-file-name)
  )

(defun get-create-test-file (current-dir buffer-file-name)
  ;; Creates or opens the test file:
  (setq test-file-name
        (concat current-dir "/tests/"
                (get-test-file-name current-dir buffer-file-name)))
  (if (file-exists-p test-file-name)
      (find-file test-file-name)
    (create-test-file test-file-name))
  ;; (message (concat current-dir "/tests" test-file-name))
  )

(defun open-test-file ()
  "Open or creates the test file for current buffer"
  ;; TODO incorporate this only for python-mode
  (interactive)
  ;; Current directory:
  (setq current-dir (file-name-directory buffer-file-name))
  (while (or (not (has-test-dir current-dir)) (is-end-leaf-dir current-dir))
    ;; Walk one directory up:
    (setq current-dir (get-parent-dir current-dir))
    )
  (if (has-test-dir current-dir)
      (get-create-test-file current-dir buffer-file-name) ;; then
    (message "No `tests/` directory found.")              ;; else
    )
  )

(global-set-key (kbd "C-c t") 'open-test-file)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
