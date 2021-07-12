# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/yonlu/.sdkman"
[[ -s "/Users/yonlu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/yonlu/.sdkman/bin/sdkman-init.sh"

source /Users/yonlu/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel9k.zsh-theme

eval $(thefuck --alias)

if type nvim > /dev/null 2>&1; then
  alias v='nvim'
fi

alias signal='cd /Users/yonlu/fix-identity/data-scripts/scripts/SignalProdCBAnalysis'
alias home='cd ~'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

alias sbtc='sbt console'
# bindkey -v # for vi
# export EDITOR=nvim
# export VISUAL=nvim


# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Git
alias gi="git init && gac 'Initial commit'"
alias gcl='git clone'

alias gs="git status"
alias gg='git log'
alias glog='git log --graph --all --decorate'
alias glin='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gac="git add . && git commit -m" # + commit message

alias gp="git push" # + remote & branch names
alias gpo="git push origin" # + branch name
alias gpom="git push origin master"

alias gl="git pull" # + remote & branch names
alias glo="git pull origin" # + branch name
alias glom="git pull origin master"
alias gf="git fetch origin"

alias gb="git branch" # + branch name
alias gc="git checkout" # + branch name
alias gcb="git checkout -b" # + branch name
alias gm='git commit'
alias grm='git restore --staged'
alias gad='git add'

alias gst='git stash'
alias gsta='git stash apply'
alias gsw='git switch'
alias gclear='git cleanup'

alias py='python'
alias act='source venv/bin/activate'

alias reload='source ~/.zshrc'
alias k='kubectl'
alias clearvpn='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
# lazygit change directory on exit
lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

alias killport='kill $(lsof -t -i :9000)'

alias config='/usr/bin/git --git-dir=/Users/yonlu/.cfg/ --work-tree=/Users/yonlu'

# Weather
alias weather='curl "wttr.in/Singapore,Hillion"
curl "http://wttr.in/Singapore,Hillion?format=v2"'

# Make ls use colors
export CLICOLOR=1
alias ls='ls -Fa'

# define colors
C_DEFAULT="\[\033[m\]"
C_WHITE="\[\033[1m\]"
C_BLACK="\[\033[30m\]"
C_RED="\[\033[31m\]"
C_GREEN="\[\033[32m\]"
C_YELLOW="\[\033[33m\]"
C_BLUE="\[\033[34m\]"
C_PURPLE="\[\033[35m\]"
C_CYAN="\[\033[36m\]"
C_LIGHTGRAY="\[\033[37m\]"
C_DARKGRAY="\[\033[1;30m\]"
C_LIGHTRED="\[\033[1;31m\]"
C_LIGHTGREEN="\[\033[1;32m\]"
C_LIGHTYELLOW="\[\033[1;33m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_LIGHTPURPLE="\[\033[1;35m\]"
C_LIGHTCYAN="\[\033[1;36m\]"
C_BG_BLACK="\[\033[40m\]"
C_BG_RED="\[\033[41m\]"
C_BG_GREEN="\[\033[42m\]"
C_BG_YELLOW="\[\033[43m\]"
C_BG_BLUE="\[\033[44m\]"
C_BG_PURPLE="\[\033[45m\]"
C_BG_CYAN="\[\033[46m\]"
C_BG_LIGHTGRAY="\[\033[47m\]"

source ~/.mongorc

. /Users/yonlu/z.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/yonlu/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/yonlu/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/yonlu/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/yonlu/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


if [[ $__INTELLIJ_COMMAND_HISTFILE__ ]]; then
  ZSH_THEME="robbyrussell"
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
