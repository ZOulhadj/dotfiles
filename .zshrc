# Lines configured by zsh-newuser-install
HISTFILE=~/.zshhistory
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/zakariya/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT='%F{blue}%B%~%b%f > '
export MOZ_ENABLE_WAYLAND=1
alias dotfiles='/usr/bin/git --git-dir=/home/zakariya/.dotfiles --work-tree=/home/zakariya'
