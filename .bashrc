#! /bin/bash

# update this according to what's used in linux
# since this was only for windows and cygwin as the terminal shell thing...
export PATH=$PATH:/cygdrive/c/Users/ander/.cargo/bin:/cygdrive/c/Program\ Files/Neovim/bin

export EDITOR=hx
export VISUAL=hx
export PAGER='less -R'
export CYGHOME="/cygwin64/$HOME"

alias grep='grep --color'                      # show differences in colour
alias ls='ls -ahF --color=tty'                 # classify files in colour
alias dir='ls -alhS --color=auto --format=vertical'
alias vdir='ls -alhS --color=auto --format=long'
alias ll='ls -l'                               # long list
alias la='ls -alhS'                            # all but . and ..
alias br='broot'
alias v='$VISUAL'
alias vim='hx'
alias proj='cd /cygdrive/c/Users/ander/projects'
alias home='cd /home/ander'
alias bp="hx $CYGHOME/.bashrc"

alias sb='source /home/ander/.bashrc'

# aliases update accordingly
alias s='git status'
# alias a='git add -A'
# alias led='cd ~/projects/LED-Art-matrix'
# alias proj='cd ~/projects'
# alias bp='vim ~/.bash_profile'
# alias a2022='cd ~/projects/aoc-2022'
# alias a2015='cd ~/projects/aoc-2015'

#setup prompt
function color_my_prompt {
    # local __user_and_host="\[\033[01;32m\]\u@\h"
    local __current_location="\[\033[01;33m\]\w"
    local __git_branch_color="\[\033[32m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[32m\]\n$"
    local __reset_color="\[\033[00m\]"
    export PS1="$__current_location $__git_branch_color$__git_branch$__prompt_tail$__reset_color "
}
color_my_prompt