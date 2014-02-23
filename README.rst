=====================
Emacs Configuration
=====================

This is the configuration I use. It is heavily oriented for web development and python.

Requirements
------------

- https://github.com/alfredo/slash-bin
- jslint


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


Useful documentation
====================

- String manipulation https://github.com/magnars/s.el

- eshell http://www.masteringemacs.org/articles/2010/12/13/complete-guide-mastering-eshell/


Update melpa packages
---------------------

Refresh the content of the packages: ``package-refresh-contents``.
Show all the available packages:``package-list-packages``.
Mark all upgradable packages with:``U``.
Execute:``x``.

Please note that once the packages are downloaded they are compiled to ``elc`` files. This makes a bit more complicated to override any pre-existing behaviour. Removing these files usually does the trick.
