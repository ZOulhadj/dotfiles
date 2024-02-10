HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Set Emacs style keybindings
bindkey -e

zstyle :compinstall filename '/home/zakariya/.zshrc'

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit

PS1='%n@%m %~$ '

alias ls="ls --color=auto"
alias grep="grep --color=auto"

# Load zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#bindkey '^I' autosuggest-accept
