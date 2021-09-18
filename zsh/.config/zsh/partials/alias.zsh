# sudo not required for some system commands
for command in mount umount sv pacman updatedb su shutdown poweroff reboot ; do
	alias $command="sudo $command"
done; unset command

alias la="ls -A"
alias lh="ls -d -A .?*" # Shows only hidden files (only on current directory)
alias rm="rm -i"
alias rm='echo "Fuck you:"' 

alias open="xdg-open"
alias vim="nvim"

# Fix commands
alias fehs="feh --scale-down --auto-zoom"
alias zathura="nohup zathura > /dev/null 2> /dev/null" 

# Black magic
alias sudo='sudo '
alias visudo="EDITOR=nvim visudo"

# Colored utilities 
alias ls='ls --color=auto'
alias grep='grep --colour=auto' alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias diff="colordiff"
alias cat="bat --plain --wrap=never --paging=never"
alias tree="tree -C"

# Custom config paths
alias wget="wget --hsts-file=\"$XDG_CACHE_HOME/wget-hsts\""
alias nvidia-settings="nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings"
alias wget="wget --hsts-file="$XDG_CACHE_HOME"/wget-hsts"
alias svn="svn --config-dir "$XDG_CONFIG_HOME"/subversion"
alias picom="picom --config $PICOM_CONFIG_PATH"
alias startx="startx \"$XDG_CONFIG_HOME/X11/xinitrc\""
