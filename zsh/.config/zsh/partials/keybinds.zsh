# Clear default keybinds
clear-keybinds

# Emacs mode
# bindkey -e

# Vi mode
# bindkey -i
# export KEYTIMEOUT=1   # Vi mode timeout for key sequences

setopt NO_FLOW_CONTROL  # Disable Ctrl+S and Ctrl+Q 

# Keybindings 
bindkey "^[[1;5C" forward-word            # C-ArrowRight
bindkey "^[[1;5D" backward-word           # C-ArrowLeft
bindkey "^H"      backward-kill-word      # C-Backspace
bindkey "\e[3~"   delete-char             # Del
bindkey "^A"      beginning-of-line       # Home
bindkey "^E"      end-of-line             # End
bindkey "^R"      fzf-history
