# My own prompt
export PROMPT="%(?.%F{green}.%F{red}[%?] )%1~%f "

# Path for my own applications
export PATH="$HOME/.local/bin/:$PATH"

# Aliases
alias ls="ls --color=auto"
alias la="ls -la --color=auto"
alias diff="diff --color=auto"
alias grep="grep --color=auto"

alias vi="vim"

# Good history
export HISTSIZE=65536
export SAVEHIST=65536
export HISTFILE="$HOME/.zsh_history"

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

