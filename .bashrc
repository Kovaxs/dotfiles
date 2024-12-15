# Settings
set -o vi

export EDITOR=nvim
# Exporting
export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace
export BASH_SILENCE_DEPRECATION_WARNING=1
# export BASH_COMPLETION_DEBUG=true
# Export PATHs
export PATH=$PATH:~/bin
if [[ $(uname) == "Darwin" ]]; then
    export PATH=/opt/homebrew/bin:$PATH
    export PATH=$PATH:$HOME/go/bin/
    # export PATH="/usr/local/bin:$PATH"
fi

# Aliases
alias l='ls -lhaFS'
alias wl='watch -n 1 ls -lh'
# alias v='nvim'
alias v='nvim'
alias vf='nvim $(fzf)'
alias ctop='TERM="${TERM/#tmux/screen}" ctop'
alias git='/run/current-system/sw/bin/git'
# alias nixu='nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/nix#kovaxs'
alias nixu='darwin-rebuild switch --flake ~/nix-darwin#kovaxs'
alias genv='printenv | grep -i'
alias c='conda activate'
alias countw='find . -type f | xargs wc -w | tail -1' # count the total number of words in all regular files located in the current directory
alias sb='source $HOME/.bashrc'

# TMP aliases
alias ck='conda activate kotaemon'

# fzf
export FD_OPTIONS="--follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="--no-mouse --height 50% --reverse --border --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

# bat
export BAT_PAGER="less -R"

# Eval
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# git 
source ~/dotfiles/.git-prompt.sh

# Misc
HISTTIMEFORMAT="%F %T "
PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@


if [[ $(uname) == "Darwin" ]]; then
    alias ssha='eval $(ssh-agent) && ssh-add'
    alias cdupct="cd $HOME/Library/CloudStorage/OneDrive-UniversidadPolitécnicadeCartagena"
    alias cdic="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs"
    alias cdr="cd $HOME/Library/CloudStorage/"
    # Aliases for project loading
    alias cda="cd $HOME/Library/CloudStorage/OneDrive-UniversidadPolitécnicadeCartagena/Escritorio/PAPILA_articles/RIF_clinical_paper/Elsevier_git/"
    alias cdo="cd $HOME/external_brain/"
    alias cw="cd $HOME/workspace/"

    # Bash completion
    [[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
    # pomo complete
    complete -C pomo pomo

# Ubuntu stuff
# elif [[ $(grep -E "^(ID|NAME)=" /etc/os-release | grep -q "ubuntu")$? == 0 ]]; then

#     alias k9s="/snap/k9s/current/bin/k9s"
#     # kubectl autocompletion
#     source <(kubectl completion bash)
fi


####################################################################################################
# Prompt function
#      ✓ ✗
####################################################################################################
if [[ $(uname) == "Darwin" ]]; then
    # Conda
    __conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
            . "$HOME/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup

fi

function __failed_cmd {
    if [[ $? -eq 0 ]]; then
        printf "\033[32m✓"
    else
        printf "\033[31m✗"
    fi
}

function __ps1(){
    GREEN="\[\033[32m\]"
    BLUE="\[\033[34m\]"
    MAGENTA="\[\033[35m\] "
    RED="\[\033[31m\]"
    YELLOW="\[\033[33m\]"
    SILVER="\[\033[37m\]"
    RESET="\[\033[0m\]"

    if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
        conda_env="$YELLOW[$BLUE$CONDA_DEFAULT_ENV$YELLOW]"
    else
        conda_env=""
    fi

    if [[ $(uname) == "Darwin" ]]; then
        APS1="$SILVER"
        APS1+=" "
    else
        APS1=" "
    fi

    if [[ -n "$IN_NIX_SHELL" ]]; then
        APS1="$BLUE"
        APS1+=" "
    fi
    
    #
    APS1+="${conda_env} ${GREEN}\u"
    APS1+="${BLUE}  \W"
    APS1+="${MAGENTA}\$(__git_ps1 '(%s )')"
    APS1+='$(__failed_cmd) '
    APS1+="${RESET}"

    PS1="$APS1"
}
#
PROMPT_COMMAND="__ps1"
    # eval $(/opt/homebrew/bin/brew shellenv)
