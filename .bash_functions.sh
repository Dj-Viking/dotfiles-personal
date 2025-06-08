
function color_my_prompt() {
    # local __user_and_host="\[\033[01;32m\]\u@\h"
    local __current_location="\[\033[01;33m\]\w"
    local __git_branch_color="\[\033[34m\]"
    local mybranch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[32m\]\n$"
    local __reset_color="\[\033[00m\]"

    PS1="$__current_location $__git_branch_color$mybranch$__prompt_tail$__reset_color "
}

function mabranch() {
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
	# if [ "$?" = "1" ]; then pulseaudio --start; fi

	echo "killed pipewire";
	echo "-----------------------------------------------------";
}


function start_pipewire () {

	# don't need pulseaudio anymore
	#switch off pulse audio if it's running check the exit code of --check
	# pulseaudio --check;
	# if [ "$?" = "0" ]; then pkill pulseaudio; fi

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
    sudo mount /dev/sda5 $HOME/hd-mount-target;
}

# this is only setup for pulling pioneer mixer recordings
function hd-mount-cp-pioneerrec () {

	if [ "" = "$1" ]; then
		echo "no file provided - usage: hd-mount-cp REC00X.WAV"
		return 1;
	fi

	if [ "" = "$2" ]; then
		echo "no path to save provided - usage: hd-mount-cp REC00X.WAV <path to save>"
		return 1;
	fi

	# just file name REC00X.WAV
	local FILE="$1";
	# /home/djviking/..
	local PATH_TO_SAVE="$2"

	# TODO: do in bash -
	# i think I wont be able to get the time the file was created easily because
	# what i think would be the 'birth' time of the file it gives some nonsensical date
	# this was just a quick hack with 
	# nodejs to make the timestamp of the recording as the filename
	local TIMESTAMP=$(node -e "console.log(require('fs').statSync('/home/djviking/hd-mount-target/PIONEER REC/$FILE').atime.toString().replaceAll(' ', '-').replaceAll(':', '-'))")
	echo "timestamp of file... 
		$TIMESTAMP
	"

	echo "copying to save path..."
	cp $HOME/hd-mount-target/PIONEER\ REC/$FILE $PATH_TO_SAVE

	echo "renaming the wav file..."
	mv "$PATH_TO_SAVE/$FILE" "$PATH_TO_SAVE/$TIMESTAMP.wav"
}

function move-rx2-recording-to-new-liveset-date-folder () {
	# mount HD  
	# look for last created REC00x.WAV file in hd-mount-target/PIONEER\ REC
	# mkdir for new liveset folder with today's date in streamvods dir
		
	# copy the file to the new dir in streamvods
	# unmount the drive
	#
	# (param)? for playing the track immediately

	echo "TODO";
	exit 1;
}
