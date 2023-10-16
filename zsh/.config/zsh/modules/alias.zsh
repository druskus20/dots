# sudo not required for some system commands
for command in mount umount sv apt pacman updatedb su shutdown poweroff reboot docker ; do
	alias $command="sudo $command"
done; unset command

alias la="ls -A"
alias lh="ls -d -A .?*" # Shows only hidden files (only on current directory)
alias rm="rm -i"
alias rm='echo "Fuck you"' 
alias "git reset --hard"='echo "Fuck you"' 

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

alias ewwt="eww -c ~/.config/eww-testing"
alias ewwc="cargo run -- --config ~/.config/eww-circular"
alias ewwg="cargo run -- --config ~/.config/eww-graph"
alias ewwt="cargo run -- --config ~/.config/eww-trans"

alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias vscode="code --enable-features=UseOzonePlatform --ozone-platform=wayland"



# Swallow some applications
alias devour="devour"
#alias google-chrome-stable="devour google-chrome-stable"
#alias chrome="devour google-chrome-stable"
#alias sxiv="devour sxiv"
#alias zathura="devour zathura"
#alias thunar="devour thunar"
#alias pavucontrol="devour pavucontrol"

alias vblist="vboxmanage list runningvms"
alias vbstop="vboxmanage controlvm kali poweroff"
alias vbstart="vboxmanage startvm kali --type headless"
alias vbssh="ssh -p 2222 kali@localhost"


alias tf=terraform
alias tfa="terraform apply"

alias docker=podman

alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."
alias "....."="cd ../../../.."
alias "......"="cd ../../../../.."
alias "......."="cd ../../../../../.."
alias "........"="cd ../../../../../../.."

alias "~"="cd ~"

alias 'exit'="[ -z "$TMUX" ] && exit || tmux detach -P"

# create or attach to main and restore session
#alias tm="[ -z "$TMUX" ] && (tmux attach-session -t main || (tmux new-session -s main \; run-shell /home/drusk/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh))"
#alias tm="tmux switch-client -t main || (tmux new-session -s main \; run-shell /home/drusk/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh)"
