=====================
Emacs Configuration
=====================

This is the configuration I use. It is heavily oriented for web development and python.

Requirements
------------

- https://github.com/alfredo/slash-bin
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


Count lines in a region::

    M-x count-lines-region or M-=

Enabling JS validation::

    M-x flymake-jslint-load

C-=  Select in semantic regions
C-c f - Go to next character typed
C-c F - Go to next character typed
C-c e - expand in semantic units
Moz mode: https://github.com/RenWenshan/emacs-moz-controller
narrow-to-region-indirect: Restrict editing in this buffer to the current region, indirectly.
C-c i -  Go to current definition.
C-c o - List lines that have pattern
shell-current-directory - shell in current directory
delete-this-buffer-and-file
M-x helm-swoop - search
During isearch M-i to hand the word over to helm-swoop
C-c p p - All projects
C-c p f - Search all files in project
M-x toggle-debug-on-error RET - Debug errors on command
M-. ctag definition at point. (Inits any mechanics).
M-x list-faces-display - view what can be changed faces.
C-x C-b - List buffers by VC.
M-x narrow-to-region-indirect - Limit edit text to selected section.


Useful documentation
====================

- eshell http://www.masteringemacs.org/articles/2010/12/13/complete-guide-mastering-eshell/
- helm/projectile http://tuhdo.github.io/helm-projectile.html
