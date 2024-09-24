# .profile
# Loads on session start

# Set utilities
export EDITOR="$HOME/.local/bin/nvim"
export BROWSER="/usr/bin/google-chrome"
export MONITOR="HDMI-0"
export TERMINAL="/bin/alacritty"
export TERM=xterm-color

# idk if it works
export XCURSOR_SIZE=16
# also:  gsettings set org.gnome.desktop.interface cursor-size 16 

# Screen sharing and flameshot 
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway
export MOZ_ENABLE_WAYLAND

# Set custom PATH
export PATH="$HOME"/.local/bin/elk:"$HOME"/.local/bin:"$HOME"/.local/bin/scripts:"$HOME"/.local/share/npm/bin:"$HOME"/.local/share/cargo/bin:"$PATH"

# Existing PATH entries
export PATH="$HOME"/.local/bin:"$HOME"/.local/share/npm/bin:"$HOME"/.local/share/cargo/bin:"$PATH"

# Include all subdirectories inside ~/.local/bin
#export PATH=$(find "$HOME/.local/bin" -type d -exec echo {}/bin \; | tr '\n' ':' | sed 's/:$//'):$PATH

# Force XDG base directories
export XDG_CONFIG_HOME="$HOME/.config" export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Man pages color support
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Stop intellij IDEs from being dumb / configure the IDE
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_AWT_WM_NONREPARTENTING=1
export JAVA_HOME="$HOME/.local/share/JetBrains/Toolbox/apps/IDEA-C/ch-0/212.5457.46/jbr/"

# Give permision to do stuff to noisetorch
#sudo setcap 'CAP_SYS_RESOURCE=+ep' /bin/noisetorch

# sxhkd uses $SHELL by default (zsh)
set -U SXHKD_SHELL sh

# Clean home foldstart
# Move junk
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd" 
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export MONO_CONFIG="$XDG_CONFIG_HOME"/mono/
export XMONAD_CONFIG_HOME="$XDG_CONFIG_HOME"/xmonad
export XMONAD_DATA_HOME="$XDG_DATA_HOME"/xmonad
export XMONAD_CACHE_HOME="$XDG_CACHE_HOME"/xmonad
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export PICOM_CONFIG_PATH="$XDG_CONFIG_HOME"/picom/picom.conf
export STACK_ROOT="$XDG_DATA_HOME"/stack
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export SUDO_ASKPASS="$HOME/.local/bin/scripts/dpass"
export SSH_ASKPASS="/usr/bin/ssh-askpass"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var 
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export XINITRC="$XDG_CONFIG_HOME"/x11/xinitrc
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export ELM_HOME="$XDG_CONFIG_HOME"/elm



# Not super tested
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export DEVPOD_CONFIG="$XDG_CONFIG_HOME"/devpod/config
export MINIKUBE_HOME="$XDG_DATA_HOME"/minikube


export GOPATH="$XDG_DATA_HOME"/go 
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod
export PATH="$GOPATH"/bin:"$PATH"

export FLYCTL_INSTALL="/home/drusk/.local/share/fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"


# Fails with LightDM
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

# Create npmrc file
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
if [ ! -f "$NPM_CONFIG_USERCONFIG" ]; then
  echo "Created $NPM_CONFIG_USERCONFIG"
  mkdir -p $XDG_CONFIG_HOME/npm 
  cat <<EOF >> $NPM_CONFIG_USERCONFIG
prefix=${XDG_DATA_HOME}/npm
cache=${XDG_CACHE_HOME}/npm
tmp=${XDG_RUNTIME_DIR}/npm
init-module=${XDG_CONFIG_HOME}/npm/config/npm-init.js
EOF
fi

# Gives too many problems
#export GNUPGHOME="$XDG_DATA_HOME"/gnupg
#export VIMINIT=":source $XDG_CONFIG_HOME/nvim/init.vim"
# foldend

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"


# Nodejs
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

## Launches on session start
#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
#  echo "Starting wayland session"
#  niri --session
#fi

# vim:foldmarker=foldstart,foldend
