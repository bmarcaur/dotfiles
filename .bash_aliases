#!/bin/bash

alias reload='source ~/.bash_profile'
alias reload_prompt='source ~/.bashrc'

alias cls='printf "\033c"'
alias ll="ls -a1"
alias gits='git st'
alias gita='git add -A :/'
alias gitd='git df'
alias gitc='git ci -m'
alias gitb='git brr | head -n 20'
alias gitp='git push -u'
alias gitmc='git -c core.editor=true merge --continue'
alias gw='./gradlew'
alias dgw='./gradlew -Dorg.gradle.debug=true --no-daemon'
alias cg='cargo'

alias vim='nvim'
alias cat='bat'
alias ls='exa'
alias sloc='scc'

alias find='echo "Did you mean to use fd?"'
alias ps='echo "Did you mean to use procs?"'
alias du='echo "Did you mean to use dust?"'
