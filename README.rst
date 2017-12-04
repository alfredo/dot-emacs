=====================
Emacs Configuration
=====================

This is the configuration I use. It is heavily oriented for web development and python.

Requirements
------------

- jslint
- Python requirements: flymake jedi

Tips
----

These are some tips I've found useful. I write them down so I can remember them.


Find a replace on certain files::

    - M-x find-name-dired: you will be prompted for a root directory and a filename pattern.
    - Press t to "toggle mark" for all files found.
    - Press Q for "Query-Replace in Files...": you will be prompted for query/substitution regexps.
    - Proceed as with query-replace-regexp: SPACE to replace and move to next match, n to skip a match, etc.


Tail file on eshell::

    cat myfile.txt > (switch-to-buffer "*my-new-buffer*")


Narrow mode. Hides all the unselected regions of a given file and shows them again::

    - Hide: C-x n n
    - Show: C-x n w

C-M-a Move to beginning of current or preceding defun (beginning-of-defun).
C-M-e Move to end of current or following defun (end-of-defun).
C-M-h Put region around whole current or following defun (mark-defun). 
M-x count-lines-region or M-=  Count lines in a region
C-x <SPC>Toggle Rectangle Mark
C-=  Select in semantic regions
C-c f - Go to next character typed
C-c F - Go to next character typed
C-c e - expand in semantic units
narrow-to-region-indirect: Restrict editing in this buffer to the current region, indirectly.
C-c i -  Go to current definition.
C-c o - List lines that have pattern
shell-current-directory - shell in current directory
M-x narrow-to-region-indirect - Limit edit text to selected section.
