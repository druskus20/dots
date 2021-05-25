# .profile
# Loads on session start

# Set utilities
export EDITOR=/usr/bin/nvim
export BROWSER=/bin/google-chrome-stable
export MONITOR="HDMI-0"
export TERMINAL="/bin/alacritty"

# Set custom PATH
export PATH="$HOME"/.local/bin:"$HOME"/.local/bin/scripts:"$PATH"

# Force XDG base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Stop intellij IDEs from being dumb 
export _JAVA_AWT_WM_NONREPARTENTING=1

# Give permision to do stuff to noisetorch
#sudo setcap 'CAP_SYS_RESOURCE=+ep' /bin/noisetorch

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
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var 
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export XINITRC="$XDG_CONFIG_HOME"/x11/xinitrc

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

# Give too many problems
#export GNUPGHOME="$XDG_DATA_HOME"/gnupg
#export VIMINIT=":source $XDG_CONFIG_HOME/nvim/init.vim"

## Launches X11 on session start
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx "$XINITRC"
fi

