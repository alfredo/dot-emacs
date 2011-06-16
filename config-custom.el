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
