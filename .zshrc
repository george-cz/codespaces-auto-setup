export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gch=smartCheckout
alias gpr="git pull --rebase"
alias ll="ls -la"

alias s="cat package.json | jq .scripts"

export REACT_EDITOR=code
ulimit -n 8192

# Git branch in prompt.
parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

GREEN="\[\033[32m\]"
YELLOW="\[\033[33m\]"
RESET="\[\033[00m\]"

function smartCheckout {
    if [[ $1 == "-b" ]]; then
        git checkout "$@"
        return 0
    fi
    if [[ $1 == "-" ]]; then
        git checkout "$@"
        return 0
    fi
    git branch | fzf -q $1 -1 | xargs git checkout
}

function branch {
    git branch | grep $1 | xargs git checkout
}

function c {
    curBranch=`git branch --show-current | egrep -o ".*?_" | head -1 | rev | cut -c 2- | rev`
    gc -m "${curBranch} $1"
}

alias bs="git branch-select"

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

. "$HOME/.atuin/bin/env"

export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"
bindkey '^r' _atuin_search_widget

