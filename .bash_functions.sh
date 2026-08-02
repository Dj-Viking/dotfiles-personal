
function color_my_prompt() {
    # local __user_and_host="\[\033[01;32m\]\u@\h"
    local __current_location="\[\033[01;33m\]\w"
    local __git_branch_color="\[\033[34m\]"
    local mybranch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[32m\]\n$"
    local __reset_color="\[\033[00m\]"

    PS1="$__current_location $__git_branch_color$mybranch$__prompt_tail$__reset_color "
}

function getgit-branch() {
    echo $(git branch 2> /dev/null | grep -e ^* | sed -E s/^\\\*\ \(.+\)$/\\\1\ /)
}

function kill_pipewire () {
	# switch off pipewire and wireplumber
	$(echo pgrep -a pipewire)
	if [ "$?" = "0" ]; then pkill pipewire; fi 

	$(echo pgrep -a pipewire-pulse)
	if [ "$?" = "0" ]; then pkill pipewire-pulse; fi 

	$(echo pgrep -a wireplumber)
	if [ "$?" = "0" ]; then pkill wireplumber; fi 

	#switch on pulseaudio
	# pulseaudio --check;
	# dont do anymore because we don't use pulse directly
	# if [ "$?" = "1" ]; then pulseaudio --start; fi

	echo "killed pipewire";
	echo "-----------------------------------------------------";
}


function start_pipewire () {

	# don't need pulseaudio anymore
	#switch off pulse audio if it's running check the exit code of --check
	# pulseaudio --check;
	# if [ "$?" = "0" ]; then pkill pulseaudio; fi

	stat /run/user/1000/pulse/native;
	if [ "$?" = "0" ]; then
		echo "removing /run/user/1000/pulse/native file to restart pipewire stuff"
		rm /run/user/1000/pulse/native
	fi

	# run pipewire and wireplumber
	$(echo pgrep -a pipewire)
	if [ "$?" = "1" ]; then (setsid pipewire &); fi 

	$(echo pgrep -a pipewire-pulse)
	if [ "$?" = "1" ]; then (setsid pipewire-pulse &); fi 

	$(echo pgrep -a wireplumber)
	if [ "$?" = "1" ]; then (setsid wireplumber &); fi 

	echo "pipewire, wireplumber, and pipewire-pulse has started";
	echo "-----------------------------------------------------";
	export PW_STARTED="1"
}

# can also be used to convert wav to mp3
function convert_video_to_wav () {

	video="$1";

	audio="$2";

	echo "run with this command below v";
	echo "ffmpeg -i $video -map 0:a -y $audio";
}

function restart_pipewire () {
	kill_pipewire;
	sleep 1;
	kill_pipewire;
	sleep 1;
	start_pipewire;
}

function hd-mount-help () {
	echo "FYI the music drive has the rx2 recordings on sda5 when it's plugged into this PC";
	echo "if you want to mount some HD and read from it";
	echo "inspect devices with 'lsblk'";
	echo "use 'sudo mount /dev/<your device> hd-mount-target'";
	echo "and unmount with 'sudo umount /dev/<your device>'"
}


function hd-mount () {
	type=$1
	if [ -z $type ]; then
		echo "error: provide type i.e. hd-mount 1";
		return 1;
	fi 

	# for now just the ssd
	if ! [ "$type" = "1" ]; then
		echo "error: type must be a number i.e. hd-mount 1";
		return 1;
	fi 
    sudo mount "/dev/sda$type" "$HOME/hd-mount-target";
}

# this is only setup for pulling pioneer mixer recordings
function hd-mount-cp-pioneerrec () {

	if [ -z "$1" ]; then
		echo "no file provided - 
		usage: hd-mount-cp-pioneerrec REC00X.WAV"
		return 1;
	fi

	if [ -z "$2" ]; then
		echo "no path to save provided - 
		usage: hd-mount-cp-pioneerrec REC00X.WAV <path to save>"
		return 1;
	fi

	# just file name REC00X.WAV
	local FILE="$1";
	# /home/djviking/..
	local PATH_TO_SAVE="$2"

	local TIMESTAMP=$(node -e "console.log(require('fs').statSync('/home/djviking/hd-mount-target/PIONEER REC/$FILE').atime.toString().replaceAll(' ', '-').replaceAll(':', '-'))")
	echo "timestamp of file... 
		$TIMESTAMP
	"

	echo "copying to save path..."
	echo "'cp $HOME/hd-mount-target/PIONEER\ REC/$FILE $PATH_TO_SAVE'"

	cp $HOME/hd-mount-target/PIONEER\ REC/$FILE $PATH_TO_SAVE

	echo "renaming the wav file..."
	echo "'mv \"$PATH_TO_SAVE/$FILE\" \"$PATH_TO_SAVE/$TIMESTAMP.wav\"'"
	mv "$PATH_TO_SAVE/$FILE" "$PATH_TO_SAVE/$TIMESTAMP.wav"
}

function move-rx2-recording-to-new-liveset-date-folder () {

	if ! [ -d "/home/djviking/hd-mount-target/PIONEER REC" ]; then
		echo "error: ssd not connected";
		return 1;
	fi

	if [ -z "$1" ]; then
		echo "no file provided - 
		usage: hd-mount-cp-pioneerrec REC00X.WAV"
		return 1;
	fi

	local FILE="$1";

	#new Date(require('fs').statSync("/home/djviking/hd-mount-target/PIONEER REC/"+require('fs').readdirSync("/home/djviking/hd-mount-target/PIONEER REC")[3]).atimeMs).toISOString().slice(0, 10)
	local TIMESTAMP=$(node -e "console.log(new Date(require('fs').statSync('/home/djviking/hd-mount-target/PIONEER REC/'+'$FILE').atimeMs).toISOString().slice(0, 10))")
	echo "timestamp of file... 
		$TIMESTAMP
	"

	local PATH_TO_SAVE="/home/djviking/streamvods/livesets/liveset-$TIMESTAMP"
	echo "path to save: $PATH_TO_SAVE"
	mkdir "$PATH_TO_SAVE"
		
	hd-mount-cp-pioneerrec $FILE $PATH_TO_SAVE

	return 0;

}

function start_screenshare () {

	(setsid /lib/xdg-desktop-portal -r &); 

	(setsid /lib/xdg-desktop-portal-wlr &); 

	export SCREENSHARE_STARTED=1
}
