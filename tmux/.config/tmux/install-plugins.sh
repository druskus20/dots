#!/usr/bin/env bash
# File: setup-tmux-plugins.sh

# Paths
TMUX_CONF="$HOME/.config/tmux/tmux.conf"
TPM_DIR="$HOME/.config/tmux/plugins/tpm"

# 1. Clone TPM if it doesn't exist
if [ ! -d "$TPM_DIR" ]; then
    echo "Cloning TPM into $TPM_DIR..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "TPM already installed at $TPM_DIR"
fi

# 2. Ensure tmux.conf exists
if [ ! -f "$TMUX_CONF" ]; then
    echo "No tmux.conf found at $TMUX_CONF, creating a default one..."
    mkdir -p "$(dirname "$TMUX_CONF")"
    cat <<'EOF' > "$TMUX_CONF"
# Minimal example for TPM
set -g @plugin 'tmux-plugins/tpm'
run '~/.config/tmux/plugins/tpm/tpm'
EOF
else
    echo "tmux.conf found at $TMUX_CONF"
fi

# 3. Reload tmux config if tmux is running
if tmux info &>/dev/null; then
    echo "Reloading tmux config..."
    tmux source-file "$TMUX_CONF"
fi

# 4. Install plugins via TPM (using tmux commands)
# This sends the keystrokes for prefix + I (Alt+w then I in your config)
echo "Installing plugins via TPM..."
tmux run-shell "$TPM_DIR/bin/install_plugins"

echo "Done! If tmux is running, plugins should now be installed."

