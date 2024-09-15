# sudo not required for some system commands
for command in mount umount sv apt pacman updatedb su shutdown poweroff reboot docker ; do
	alias $command="sudo $command"
done; unset command

alias ls="eza"
alias la="eza -A"
alias lh="eza -d -A .?*" # Shows only hidden files (only on current directory)
alias rm="rm -i"
alias rm='echo "Fuck you"' 
alias "git reset --hard"='echo "Fuck you"' 

alias open="xdg-open"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

# Fix commands
alias fehs="feh --scale-down --auto-zoom"
alias zathura="nohup zathura > /dev/null 2> /dev/null" 

# Black magic
alias sudo='sudo '
alias visudo="EDITOR=nvim visudo"

# Colored utilities 
alias ls='eza --color=auto'
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

# Shorthands
alias k="kubectl"
alias g="git"
alias ga="git add"
alias gA="git add -A"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit -a"
alias gp="git push"
alias gw="git switch"
alias GG="git add -A && git commit && git push"

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

alias todo="$EDITOR $HOME/doc/TODO.md"

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

alias npm="pnpm"

alias "~"="cd ~"

alias 'exit'="[ -z "$TMUX" ] && exit || tmux detach -P"
alias ':q'="[ -z "$TMUX" ] && exit || tmux detach -P"
alias suspend="sudo systemctl suspend"

alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'

alias gunwip='git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'

# create or attach to main and restore session
#alias tm="[ -z "$TMUX" ] && (tmux attach-session -t main || (tmux new-session -s main \; run-shell /home/drusk/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh))"
#alias tm="tmux switch-client -t main || (tmux new-session -s main \; run-shell /home/drusk/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh)"
