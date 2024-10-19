# -------------------------------------------------
# Should go first

# Start tmux (only if not already in a tmux session)
function safe-start-tmux() {
  emulate -L zsh
  # Needs to go before tmux
  export TERM=xterm-256color
  case $- in *i*)
    if [ -z "$TMUX" ]; then  
      # Custom tmux stuff - buffer one tmux session ahead to make startup instant
      tmux attach -t buffer || (tmux new -d -s buffer && tmux new -t buffer -A )
    fi
  esac
}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
function instant-prompt() {
  emulate -L zsh
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
}

# -------------------------------------------------

function completions() {
  emulate -L zsh
  # 1. Load
  autoload -U compinit
  compinit -u  # Avoid unnecessary recompilation of completion cache

  # 2. Enhanced completion listing
  zmodload zsh/complist

  # 3. Other:
  # Enable menu selection for completion
  zstyle ':completion:*' menu select
  # Include hidden files in completion
  _comp_options+=(globdots)
  # Autocomplete from the middle of a word 
  # zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'

  # Competions
  autoload bashcompinit && bashcompinit
  complete -C '/usr/local/bin/aws_completer' aws
  source <(helm completion zsh)
  source <(kubectl completion zsh)
  compdef kubecolor=kubectl
  source <(gh completion -s zsh)
  source <(rustup completions zsh rustup)
  # TODO: find a way to source the "non compdef" completions without breaking fast start
  # (adding them to fpath - breaks fast start)
  # I am not sure why - maybe I am not caching the compdump properly?
  #source <(rustup completions zsh cargo) # breaks fast start
  source $ZDOTDIR/completions/_eza # avoid breaking fast start
}

function history-settings() {
  emulate -L zsh
  HISTFILE="$XDG_CACHE_HOME/zsh/history"
  HISTSIZE=50000
  SAVEHIST=50000
}

function zsh-options() {
  
  # no emulate -L zsh - we actually want to affect the shell
  # Completion
  setopt AUTO_LIST               # automatically list choices on ambiguous completion
  setopt AUTO_MENU               # show completion menu on a successive tab press
  setopt AUTO_PARAM_SLASH        # if completed parameter is a directory, add a trailing slash
  setopt COMPLETE_IN_WORD        # complete from the cursor rather than from the end of the word
  setopt NO_MENU_COMPLETE        # do not autoselect the first completion entry
  setopt HASH_LIST_ALL
  setopt ALWAYS_TO_END

  # History
  setopt HIST_SAVE_NO_DUPS
  setopt HIST_IGNORE_ALL_DUPS
  setopt SHARE_HISTORY             # write and import history on every command
  setopt HIST_FIND_NO_DUPS 

  # OTHER
  setopt INTERACTIVE_COMMENTS    # allow comments in command line

  setopt IGNORE_EOF               # ignore EOF, do not exit shell with Ctrl-D 
  setopt NOBEEP
}

function plugins() {
  source "$ZDOTDIR/plugins/fast-syntax-highlighting/F-Sy-H.plugin.zsh"
  source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "$ZDOTDIR/plugins/zsh-you-should-use/you-should-use.plugin.zsh"
  source "$ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" 

  # Some quick plugin settings
  ZSH_HIGHLIGHT_MAXLENGTH=100  
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#85858f,bold,underline"

  # vicmd '^[[A' shouldnt be bound because its the same keycode as ESC (causes problems with vi-mode)
  bindkey -M viins '^[[A' history-substring-search-up    # Arrow up
  bindkey -M viins '^[[B' history-substring-search-down  # Arrow down
  bindkey -M vicmd '^K'   history-substring-search-up    
  bindkey -M viins '^K'   history-substring-search-up    
  bindkey -M vicmd 'k'   history-substring-search-up    
  bindkey -M vicmd '^J'   history-substring-search-down  
  bindkey -M vicmd 'j'   history-substring-search-down  
  bindkey -M viins '^J'   history-substring-search-down  
}

function modules() {
  emulate -L zsh
  source "$ZDOTDIR/modules/keybinds.zsh"
  source "$ZDOTDIR/modules/alias.zsh"
}

# -------------------------------------------------
# Should go last 
# no "emulate -L zsh" - p10k does not like it
function load-prompt() {
  source "$ZDOTDIR"/plugins/powerlevel10k/powerlevel10k.zsh-theme
  # To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
  [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
}

# -------------------------------------------------

safe-start-tmux
instant-prompt
completions
history-settings
zsh-options
plugins
modules
load-prompt

# More? https://github.com/romkatv/zsh4humans/tree/v5/fn
# TODO: teleportation
# TODO: compile completions
# TODO: C-I / C-O like in vim but for directories
