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
export BROWSER='/usr/bin/chromium'

# aliases
alias start-docker-service='systemctl start docker.service'
alias full='brightnessctl set 24000'
alias half='brightnessctl set 12000'
alias dim='brightnessctl set 5000'
alias a='git add -A'
alias s='git status'
alias ll='ls -l'
alias z="zathura"
alias i="nsxiv"
alias p="$PAGER"
alias v="$VISUAL"
alias e="$EDITOR"
alias bp='vim ~/.bashrc'
alias bf='vim ~/.bash_functions.sh'
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

function hd-mount-help () {
	echo "FYI the music drive has the rx2 recordings on sda5 when it's plugged into this PC";
	echo "if you want to mount some HD and read from it";
	echo "inspect devices with 'lsblk'";
	echo "use 'mount /dev/<your device> hd-mount-target'";
}

function move-rx2-recording-to-new-liveset-date-folder () {
	# mount HD  
	# look for last created REC00x.WAV file in hd-mount-target/PIONEER\ REC
	# mkdir for new liveset folder with today's date
	# copy the file to the new dir in streamvods
	# unmount the drive
	#
	# (param)? for playing the track immediately

	echo "TODO";
	exit 1;
}

# call functions
color_my_prompt;


if ! [ "$PW_STARTED" = "1" ]; then 
	kill_pipewire;
	sleep 1;
	start_pipewire;
fi

