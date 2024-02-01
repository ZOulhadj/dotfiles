# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/zakariya/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PS1='%n@%m %~$ '

alias ls="ls --color=auto"
alias screen="swaymsg output eDP-1 toggle"


