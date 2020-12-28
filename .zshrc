#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/yonlu/.sdkman"
[[ -s "/Users/yonlu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/yonlu/.sdkman/bin/sdkman-init.sh"

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

alias gb="git branch" # + branch name
alias gc="git checkout" # + branch name
alias gcb="git checkout -b" # + branch name
alias gm='git commit'
alias grm='git restore --staged'
alias gad='git add'

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

alias rohan='open "zoommtg://zoom.us/join?confno=8647425327"'

alias zoom='open "zoommtg://zoom.us/join?confno=3017104516"'


alias config='/usr/bin/git --git-dir=/Users/yonlu/.cfg/ --work-tree=/Users/yonlu'
