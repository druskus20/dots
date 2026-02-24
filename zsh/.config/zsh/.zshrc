# -------------------------------------------------
# Should go first

# Start tmux (only if not already in a tmux session)
function safe-start-tmux() {
  # Needs to go before tmux
  #export TERM=xterm-256color
  case $- in *i*)
    if [ -z "$TMUX" ] && [ -z "$ZELLIJ" ] ; then  
      # Custom tmux stuff - buffer one tmux session ahead to make startup instant
      tmux attach -t buffer || (tmux new -d -s buffer && tmux new -t buffer -A )
      #zellij 


      #zellij a -b "buffer" # start a background session called buffer
      #zellij attach "buffer" && zellij action rename-session "main" && zellij a -b "buffer"
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
  autoload -Uz compinit
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

  autoload -Uz bashcompinit && bashcompinit
  # Competions

  # AWS CLI
  if command -v aws_completer >/dev/null 2>&1; then
    complete -C "$(command -v aws_completer)" aws
  fi

  # just
  if command -v just >/dev/null 2>&1; then
    source <(just --completions zsh)
  fi

  # helm
  if command -v helm >/dev/null 2>&1; then
    source <(helm completion zsh)
  fi

  # kubectl / kubecolor
  if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion zsh)
  fi
  if command -v kubecolor >/dev/null 2>&1; then
    compdef kubecolor=kubectl
  fi

  # gh (GitHub CLI)
  if command -v gh >/dev/null 2>&1; then
    source <(gh completion -s zsh)
  fi

  # rustup
  if command -v rustup >/dev/null 2>&1; then
    source <(rustup completions zsh rustup)
  fi

  ## podman
  #if command -v podman >/dev/null 2>&1; then
  #  source <(podman completion zsh)
  #fi

  # asdf
  if command -v asdf >/dev/null 2>&1; then
    source <(asdf completion zsh)
  fi


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
  

  #source "$ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh"
  # 
  ## fzf-tab settings
  ## disable sort when completing `git checkout`
  #zstyle ':completion:*:git-checkout:*' sort false
  ## set descriptions format to enable group support
  ## NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
  #zstyle ':completion:*:descriptions' format '[%d]'
  ## set list-colors to enable filename colorizing
  ##zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  ## force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
  #zstyle ':completion:*' menu no
  ## preview directory's content with eza when completing cd
  ## custom fzf flags
  ## NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
  #zstyle ':fzf-tab:*' fzf-flags 
  ## To make fzf-tab follow FZF_DEFAULT_OPTS.
  ## NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
  #zstyle ':fzf-tab:*' use-fzf-default-opts yes
  ## switch group using `<` and `>`
  #zstyle ':fzf-tab:*' switch-group '<' '>'
  ## elko's thing
  #zstyle ':fzf-tab:complete:*:*' fzf-preview '$ZDOTDIR/plugins/fzf-tab/elkos-preview-thing.sh $realpath'

  # Some quick plugin settings
  ZSH_HIGHLIGHT_MAXLENGTH=100  
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#85858f,bold,underline"
  
  ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="100"
  ZSH_AUTOSUGGEST_USE_ASYNC=1 # should be default anyway
  
  # Huge performance increase
  # https://github.com/zsh-users/zsh-autosuggestions?tab=readme-ov-file#disabling-automatic-widget-re-binding
  ZSH_AUTOSUGGEST_MANUAL_REBIND=no 

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
  source "$ZDOTDIR"/plugins/powerlevel10k.git/powerlevel10k.zsh-theme
  # To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
  [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
}

# -------------------------------------------------

if [[ $TMUX_ENABLED == "true" ]]; then
  safe-start-tmux
  instant-prompt
fi

# This needs to go bellow instant-prompt
export TERM=xterm-256color

completions
history-settings
zsh-options
plugins
modules
load-prompt
p10k finalize

## More? https://github.com/romkatv/zsh4humans/tree/v5/fn
## TODO: teleportation
## TODO: compile completions
## TODO: C-I / C-O like in vim but for directories
#
#export PATH=$PATH:/home/drusk/.spicetify
#
#
#
#export NVM_DIR="$HOME/.config/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


