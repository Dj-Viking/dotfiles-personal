echo -e "\033[01;34m ( ._.)"

source ~/.bash_functions.sh

# exports
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_DIR=$HOME/.local/state
export XDG_RUNTIME_DIR=$HOME/.local/run

export PATH=$PATH:$HOME/scripts/ 

#ableton through wine
# wherever steam installed ableton when the msi was run inside steam with proton experimental
alias ableton="(setsid wine /home/djviking/.steam/steam/steamapps/compatdata/4243261831/pfx/drive_c/ProgramData/Ableton/Live\ 10\ Suite/Program/Ableton\ Live\ 10\ Suite.exe &)"

# set the godot env stuff
source ~/.config/godotenv/env
# . "$HOME/.config/godotenv/env" # Added by GodotEnv
# GODOT=~/.config/godotenv/godot/bin/godot
alias godot="(setsid $GODOT &)"

#gamejam stuffs
source ~/.glcrds

# dotnet paths
export DOTNET_ROOT=$HOME/.dotnet/
export PATH=$PATH:$HOME/.dotnet/

# aseprite
export PATH=$PATH:$HOME/.local/share/Steam/steamapps/common/Aseprite/

# dotnet tools paths
# (includes powershell)
export PATH=$PATH:$HOME/.local/share/dotnet/.dotnet/tools

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

# wineprefix
export WINEDLLOVERRIDES="d2d1=d"
export WINEARCH=win64
# export WINEPREFIX=$XDG_DATA_HOME/wine
export WINEPREFIX=~/.wine64.ableton

export CARGO_NET_GIT_FETCH_WITH_CLI=true
export DOTNET_CLI_TELEMETRY_OPTOUT=1

export PAGER='less -R'
export VISUAL='nvim'
export EDITOR='nvim'
export BROWSER='/usr/bin/chromium'

# aliases
alias jka='(setsid ./.steam/steam/steamapps/common/Jedi\ Academy/GameData_OpenJK/jamp &)'
alias c='vscodium .'
alias gamejam='cd ~/projects/chromajam-2025/src/ChromaJam2025/'
alias powershell='pwsh'
alias start-docker-service='systemctl start docker.service'
alias full='brightnessctl set 24000'
alias half='brightnessctl set 12000'
alias dim='brightnessctl set 5000'
alias dimmer='brightnessctl set 1000'
alias a='git add -A'
alias s='git status'
alias ll='ls -l'
alias z="zathura"
alias i="nsxiv"
alias p="$PAGER"
alias v="$VISUAL"
alias e="$EDITOR"
alias bp='v ~/.bashrc'
alias bf='v ~/.bash_functions.sh'
alias sb='source ~/.bashrc'
alias charge='cat /sys/class/power_supply/BAT0/charge_now'
alias ?='echo $?'

alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
alias jgd='cd /home/djviking/.steam/steam/steamapps/common/Jedi\ Academy/GameData'

alias poop='echo "LDKFJDKJFDKJFPPPOOPPOTOPOTOHTOHTPTPTOHPOHOPTHPH"'
alias wipe="sudo pacman -Rscnd"
alias cleanup="sudo pacman -Rns; pacman -Qdtq"

alias dcord='setsid /home/djviking/Downloads/Discord/Discord &'
alias kill_dcord='pkill Discord'
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"
alias ls='ls -A --color=auto'
alias paru='paru --removemake=yes --bottomup --cleanafter'
alias xclip="xclip -selection clipboard"
alias nl="nl -w1 -s' | ' -b a"
alias rsync="rsync -v --progress"
alias proj='cd ~/projects/'
alias led='cd ~/projects/led-art-matrix'
alias rva='cd ~/projects/rust-visual-art'
alias gpo='git push origin'

alias gargo='cargo'
alias car='cargo run'
alias carrelease='cargo run --release'
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
alias rmidi='cd ~/projects/rust-midi;';


# call functions
color_my_prompt;


if ! [ "$PW_STARTED" = "1" ]; then 
	kill_pipewire;
	sleep 1;
	start_pipewire;
fi

