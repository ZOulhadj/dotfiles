# Dotfiles
These are my Linux dotfiles managed by [GNU
Stow](https://www.gnu.org/software/stow/)

The dotfiles can located anywhere in your home folder but I prefer to put
everything into a ``~/dotfiles`` folder. Call ``make`` inside the folder which
will automatically generate symbolic links to all dotfiles relative to the home
folder. On the other handle, ``make delete`` will remove all symbolic links.

# Software
All packages that I install can be found in ``applications.txt``.
