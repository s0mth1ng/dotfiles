export ZSH="$HOME/.oh-my-zsh"

plugins=(git z zsh-syntax-highlighting zsh-autosuggestions)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

fzf-git-checkout() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    local branch

    branch=$(fzf-git-branch)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}

alias copy='pbcopy'
alias ls='eza --icons --color auto --git'
alias lt='eza --icons --color auto --git --tree -L 2'
alias code='open -b com.microsoft.VSCode "$@"'
alias ff='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias fb='fzf-git-checkout'
alias gt='cd ~ && cd $(fd --type directory -E Library | fzf)'
alias gcom='gco master && ggl'
alias c='code'
alias mr='glab mr view -w'
alias repo='glab repo view -w'
alias lg='lazygit'
alias lock='poetry lock --no-update'
alias locki='poetry lock --no-update && make install-deps'
alias pu='git push --force-with-lease'

function qou {
	awk '{printf "\"%s\",", $1}' | sed 's/.$//g'
}

export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_DEFAULT_OPTS='--no-height --walker-skip .git,.venv,.mypy_cache,.ruff_cache,__pycache__,node_modules'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
	--preview 'bat -n --color=always {}'
	--bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_ALT_C_OPTS="
	--preview 'eza --icons --color auto --git --tree -L 2 {}'"

export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export GOROOT="/opt/homebrew/opt/go/libexec"
export BAT_THEME="OneHalfDark"
export HOMEBREW_NO_AUTO_UPDATE=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

. /opt/homebrew/etc/profile.d/z.sh

eval "$(starship init zsh)"

source "$HOME/.rye/env"
source "$HOME/.cargo/env"
