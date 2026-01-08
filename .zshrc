set -o vi

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt share_history
setopt extended_glob

autoload -U edit-command-line && zle -N edit-command-line
bindkey -M vicmd v edit-command-line

autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-dirs-first true

function co {
	awk '{printf "%s,", $1}' | sed 's/.$//g'
}

function qou {
	awk '{printf "\"%s\"\n", $1}'
}

alias ls='eza --icons --git'
alias lt='eza --icons --git --tree -L 2'
alias l='ls -la'
alias v='nvim .'
alias vi='nvim'
alias gst='git status'
alias gf='git fetch'
alias gco='git checkout'
alias ggl='git pull'
alias gcl='git clone'
alias lg='lazygit'
alias gcom='gco master && ggl'
alias uuid='python3 -c "import uuid; print(uuid.uuid4())"'

export EDITOR=nvim

fpath+=("/opt/homebrew/share/zsh/site-functions")

autoload -Uz promptinit
promptinit
prompt pure
zstyle :prompt:pure:git:dirty color red
zstyle :prompt:pure:git:branch color magenta
zstyle :prompt:pure:git:branch color magenta
zstyle :prompt:pure:prompt:success color green
prompt_newline='%666v'
PROMPT=" $PROMPT"

# Sources
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)
