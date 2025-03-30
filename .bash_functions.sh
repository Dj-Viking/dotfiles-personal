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
	$(echo pgrep -a wireplumber)
	if [ "$?" = "0" ]; then pkill wireplumber; fi 
	$(echo pgrep -a pipewire-pulse)
	if [ "$?" = "0" ]; then pkill pipewire-pulse; fi 

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
	$(echo pgrep -a wireplumber)
	if [ "$?" = "1" ]; then (setsid wireplumber &); fi 
	$(echo pgrep -a pipewire-pulse)
	if [ "$?" = "1" ]; then (setsid pipewire-pulse &); fi 

	echo "pipewire, wireplumber, and pipewire-pulse has started";
	echo "-----------------------------------------------------";
	export PW_STARTED="1"
}

function gtkradiant() {
	(setsid ~/./projects/GtkRadiant/install/radiant.bin &)
}
