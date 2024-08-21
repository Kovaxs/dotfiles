# Settings
set -o vi

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
    export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET" 
    export PATH=/opt/homebrew/bin:$PATH
    export PATH=$PATH:$HOME/go/bin/
fi

# Aliases
alias l='ls -lhaFS'
alias wl='watch -n 1 ls -lh'
alias v='nvim'
alias vf='nvim $(fzf)'

# fzf
export FD_OPTIONS="--follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="--no-mouse --height 50% --reverse --border --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fdfind --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fdfind $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fdfind --type d $FD_OPTIONS"

# bat
export BAT_PAGER="less -R"

# Eval
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

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
    alias cdo="cd $HOME/OutsideBrain/"
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/oleksandr/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/oleksandr/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/oleksandr/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/oleksandr/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


if [[ $(uname) == "Darwin" ]]; then
    # Conda
    __conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
            . "$HOME/miniconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        else
            export PATH="$HOME/miniconda3/bin:$PATH"  # commented out by conda initialize
        fi
    fi
    unset __conda_setup

fi

# Prompt function
__ps1() {
    local P='$' dir="${PWD##*/}" B countme short long double conda_env \
        r='\[\e[31m\]' g='\[\e[32m\]' h='\[\e[34m\]' \
        u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
        b='\[\e[36m\]' x='\[\e[0m\]' 

    [[ $EUID == 0 ]] && P='#' && u=$r && p=$u  # If user is root, use # and change colors
    [[ $PWD = / ]] && dir=/
    [[ $PWD = "$HOME" ]] && dir='~'

    B=$(git branch --show-current 2>/dev/null)
    [[ $dir = "$B" ]] && B=.
    countme="$USER$PROMPT_AT$(hostname):$dir($B)\$ "
    bc="$b"
    [[ $B == master || $B == main ]] && b="$r"
    [[ -n "$B" ]] && B="$g($b$B$g)"
    
    # Add Conda Environment to the Prompt
    if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
        conda_env="$g[$bc$CONDA_DEFAULT_ENV$g]"  # Conda environment at the beginning in green
    else
        conda_env=""
    fi

    if [[ $(uname) == "Darwin" ]]; then
        PS1="${conda_env} $u\u$g$PROMPT_AT$h\h$g:$w$dir$B$p$P$x "
    else
        short="${conda_env} $u\u$g$PROMPT_AT$h\h$g:$w$dir$B$p$P$x "
        long="$g╔${conda_env} $u\u$g$PROMPT_AT$h\h$g:$w$dir$B\n$g╚$p$P$x "
        double="$g╔${conda_env} $u\u$g$PROMPT_AT$h\h$g:$w$dir\n$g║$B\n$g╚$p$P$x "

        if ((${#countme} + ${#conda_env} > PROMPT_MAX)); then
            PS1="$double"
        elif ((${#countme} + ${#conda_env} > PROMPT_LONG)); then
            PS1="$long"
        else
            PS1="$short"
        fi
    fi
}

PROMPT_COMMAND="__ps1"

if [[ $(uname) == "Darwin" ]]; then
    . "$HOME/.cargo/env"
fi
# eval "$(register-python-argcomplete conda)"

