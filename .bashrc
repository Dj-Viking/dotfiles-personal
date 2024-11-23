echo -e "\033[01;34m ( ._.)"

function color_my_prompt {
    # local __user_and_host="\[\033[01;32m\]\u@\h"
    local __current_location="\[\033[01;33m\]\w"
    local __git_branch_color="\[\033[34m\]"
    local mybranch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[32m\]\n$"
    local __reset_color="\[\033[00m\]"
    export thing="$__current_location $__git_branch_color$mybranch$__prompt_tail$__reset_color "
}
color_my_prompt
PS1="$thing"
# export PS1="\e[34;1m\w \e[38;5;214m| |
# >> \e[0m"

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_DIR=$HOME/.local/state
export XDG_RUNTIME_DIR=$HOME/.local/run

export PATH=$PATH:$HOME/scripts/ 
export PATH=$PATH:$XDG_DATA_HOME/cargo/bin/
export PATH=$PATH:$HOME/bin/
export PATH=$PATH:$OPT_CHROME/

export CARGO_HOME=$XDG_DATA_HOME/cargo
export CUDA_CACHE_PATH=$XDG_CACHE_HOME/nv
export LESSHISTFILE
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export NODE_REPL_HISTORY=$XDG_CACHE_HOME/node/repl_history
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export DOTNET_CLI_HOME=$XDG_DATA_HOME/dotnet
export GOPATH=$XDG_DATA_HOME/go
export LEIN_HOME=$XDG_DATA_HOME/lein
export NUGET_PACKAGES=$XDG_DATA_HOME/nuget
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export WINEPEFIX=$XDG_DATA_HOME/wine

export CARGO_NET_GIT_FETCH_WITH_CLI=true
export DOTNET_CLI_TELEMETRY_OPTOUT=1

export PAGER='less -R'
export VISUAL='nvim'
export EDITOR='nvim'
export BROWSER='chrome'

alias a='git add -A'
alias s='git status'
alias z="zathura"
alias i="nsxiv"
alias p="$PAGER"
alias v="$VISUAL"
alias e="$EDITOR"
alias bp='nvim ~/.bashrc'
alias sb='source ~/.bashrc'

alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'

alias poop='echo "LDKFJDKJFDKJFPPPOOPPOTOPOTOHTOHTPTPTOHPOHOPTHPH"'
alias wipe="doas pacman -Rscnd"
alias cleanup="doas pacman -Rns (pacman -Qdtq)"

alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"
alias ls='ls -A --color=auto'
alias paru='paru --removemake=yes --bottomup --cleanafter'
alias xclip="xclip -selection clipboard"
alias nl="nl -w1 -s' | ' -b a"
alias rsync="rsync -v --progress"
alias proj='cd ~/projects/'

alias rg='cargo run'
alias carr="RUSTFLAGS='-Zmacro-backtrace' cargo +nightly run --quiet"
alias carq="RUSTFLAGS='-Awarnings' cargo +nightly --quiet"
alias barq="RUST_BACKTRACE=1 RUSTFLAGS=-Awarnings cargo +nightly --quiet"
alias carf="cargo +nightly fmt --all"
alias care="cargo +nightly eval"
alias bacc="bacon clippy"
alias bect="bacon test --nocapture"
alias cart="cargo +nightly test --quiet --nocapture"
alias cardb="RUSTFLAGS='-Zmacro-backtrace -Awarnings -g' cargo +nightly with gdb --"
alias carx="RUSTFLAGS='-Awarnings' cargo +nightly expand"
alias cinit="cargo generate -g https://github.com/slbsh/cargo-generate -b master"
alias cslap="cargo generate -g https://github.com/slbsh/cargo-generate -b slapcode"

