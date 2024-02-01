# Dotfiles
These are my Linux dotfiles managed by [GNU
Stow](https://www.gnu.org/software/stow/)

The dotfiles can located anywhere in your home folder but I prefer to put
everything into a ``~/.dotfiles`` folder. Call ``make`` inside the folder which
will automatically generate symbolic links from the dotfiles folder to your home
folder. The advantage of this is that it allows for all the dotfiles to be
located within the same folder under version control whilst still allowing a
system to find the various configurations. To undo all the symbolic links, run
``make delete``.

# Software
All packages that I install can be found in ``applications.txt``.
