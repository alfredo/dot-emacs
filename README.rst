=====================
Emacs Configuration
=====================

This is the configuration that I use on my machines


====
Tips
====

These are some tips I've found useful. I write them down so I can remember them.


Find and replace
----------------

Find a replace on certain files::

- M-x find-name-dired: you will be prompted for a root directory and a filename pattern.
- Press t to "toggle mark" for all files found.
- Press Q for "Query-Replace in Files...": you will be prompted for query/substitution regexps.
- Proceed as with query-replace-regexp: SPACE to replace and move to next match, n to skip a match, etc.


Tail file on eshell
-------------------

eshell::

cat myfile.txt > (switch-to-buffer "*my-new-buffer*")


Narrow mode
-----------

Hides all the unselected regions of a given file and shows them again::

- Hide: C-x n n
- Show: C-x n w


M-x count-lines-region or M-=
