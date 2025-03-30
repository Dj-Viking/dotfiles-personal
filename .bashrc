echo -e "\033[01;34m ( ._.)"

source ~/.bash_functions.sh

# exports
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

# aliases
alias a='git add -A'
alias s='git status'
alias z="zathura"
alias i="nsxiv"
alias p="$PAGER"
alias v="$VISUAL"
alias e="$EDITOR"
alias bp='nvim ~/.bashrc'
alias bf='nvim ~/.bash_functions.sh'
alias sb='source ~/.bashrc'
alias charge='cat /sys/class/power_supply/BAT0/charge_now'

alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
alias jgd='cd /home/djviking/.steam/steam/steamapps/common/Jedi\ Academy/GameData'

alias poop='echo "LDKFJDKJFDKJFPPPOOPPOTOPOTOHTOHTPTPTOHPOHOPTHPH"'
alias wipe="sudo pacman -Rscnd"
alias cleanup="sudo pacman -Rns; pacman -Qdtq"

alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"
alias ls='ls -A --color=auto'
alias paru='paru --removemake=yes --bottomup --cleanafter'
alias xclip="xclip -selection clipboard"
alias nl="nl -w1 -s' | ' -b a"
alias rsync="rsync -v --progress"
alias proj='cd ~/projects/'
alias led='cd ~/projects/led-art-matrix'
alias gpo='git push origin'

alias gargo='cargo'
alias car='cargo run'
alias cg='cargo clippy -- -Fclippy::all'
alias carr="RUSTFLAGS='-Zmacro-backtrace' cargo +nightly run --quiet"
alias carq="RUSTFLAGS='-Awarnings' cargo +nightly --quiet"
alias barq="RUST_BACKTRACE=1 RUSTFLAGS=-Awarnings cargo +nightly --quiet"
alias carf="cargo +nightly fmt --all"
alias care="cargo +nightly eval"
alias bacc="bacon clippy"
alias bect="bacon test --nocapture"
alias cart="cargo +nightly test --quiet --nocapture"
alias cardb="RUSTFLAGS='-Zmacro-backtrace -Awarnings -g' cargo +nightly with gdb --"
alias carx="RUSTFLAGS=-Awarnings cargo +nightly expand"
alias cinit="cargo generate -g https://github.com/slbsh/cargo-generate -b master"
alias cslap="cargo generate -g https://github.com/slbsh/cargo-generate -b slapcode"

# call functions
color_my_prompt;

if ! [ "$PW_STARTED" = "1" ]; then 
	kill_pipewire;
	sleep 1;
	start_pipewire;
fi
