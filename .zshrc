# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/doomsday/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep nomatch notify
unsetopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install

#aliases
alias ls='ls --color -h'

# My prompt
PROMPT='%~ > '
RPROMPT='%F{yellow}[%t]%F{white}'
