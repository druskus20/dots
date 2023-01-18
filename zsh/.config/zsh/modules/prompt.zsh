source "$ZDOTDIR"/plugins/gitstatus/gitstatus.plugin.zsh

# To be able to use: "%{$fg[red]$bg[red]%}"
autoload -U colors && colors

# This allows expansions
setopt PROMPT_SUBST

# Updates editor information when the keymap changes. foldstart
function zle-line-init zle-keymap-select {
    case $KEYMAP in
      vicmd)      VI_INDICATOR="%{$fg[magenta]%}"   ;;
      main|viins) VI_INDICATOR="%{$fg[blue]%}ﴨ"   ;;
    esac
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
# foldend

# Gitstatus foldstart
# https://github.com/romkatv/gitstatus/blob/master/gitstatus.prompt.zsh
function gitstatus_prompt_update() {
  emulate -L zsh
  typeset -g  GITSTATUS_PROMPT=''

  # Call gitstatus_query synchronously. Note that gitstatus_query can also be called
  #  asynchronously; see documentation in gitstatus.plugin.zsh.
  gitstatus_query 'MY'                  || return 1  # error
  [[ $VCS_STATUS_RESULT == 'ok-sync' ]] || return 0  # not a git repo

  local p
  local where  # branch name, tag or commit
  if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
    where=$VCS_STATUS_LOCAL_BRANCH
  elif [[ -n $VCS_STATUS_TAG ]]; then
    p+='%f#'
    where=$VCS_STATUS_TAG
  else
    p+='%f@'
    where=${VCS_STATUS_COMMIT[1,8]}
  fi

  (( $#where > 32 )) && where[13,-13]="…"  # truncate long branch names and tags
  p+="${cl}${where//\%/%%}"             # escape %
  [[ -n $VCS_STATUS_ACTION     ]] && p+=" ${VCS_STATUS_ACTION}" # 'merge'
  (( VCS_STATUS_NUM_CONFLICTED )) && p+=" ~${VCS_STATUS_NUM_CONFLICTED}"
  (( VCS_STATUS_NUM_STAGED     )) && p+=" +${VCS_STATUS_NUM_STAGED}"
  (( VCS_STATUS_NUM_UNSTAGED   )) && p+=" !${VCS_STATUS_NUM_UNSTAGED}"
  (( VCS_STATUS_NUM_UNTRACKED  )) && p+=" ?${VCS_STATUS_NUM_UNTRACKED}"

  GITSTATUS_PROMPT=" ${p}%f "
}

# Start gitstatusd instance with name "MY". The same name is passed to
# gitstatus_query in gitstatus_prompt_update. The flags with -1 as values
# enable staged, unstaged, conflicted and untracked counters.
gitstatus_stop 'MY' && gitstatus_start -s -1 -u -1 -c -1 -d -1 'MY'

# On every prompt, fetch git status and set GITSTATUS_PROMPT.
autoload -Uz add-zsh-hook
add-zsh-hook precmd gitstatus_prompt_update
# foldend

# Virtualenv foldstart
function virtenv_indicator {
    if [[ -z $VIRTUAL_ENV ]] then
        VIRTUAL_ENV_INDICATOR=''
    else
        VIRTUAL_ENV_INDICATOR=" ${VIRTUAL_ENV##*/} "
    fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd virtenv_indicator

# Disable default virtualenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1 
# foldend

# function last_command_dice {
#    local d=$(( ( $RANDOM % 6 ) + 1 ))
#    [ $d -eq 1 ] && CMD_DICE=""
#    [ $d -eq 2 ] && CMD_DICE=""
#    [ $d -eq 3 ] && CMD_DICE=""
#    [ $d -eq 4 ] && CMD_DICE=""
#    [ $d -eq 5 ] && CMD_DICE=""
#    [ $d -eq 6 ] && CMD_DICE=""
# }
# autoload -Uz add-zsh-hook
# add-zsh-hook precmd last_command_dice

# This needs to be in simple quotes
# https://unix.stackexchange.com/questions/32124/set-variables-in-zsh-precmd-and-reference-them-in-the-prompt
PROMPT=''
PROMPT+='%B'  # Bold
PROMPT+='%(?:%{$fg[green]%}✓:%{$fg[red]%}✕) '
# PROMPT+='%(?:%{$fg[green]%}:%{$fg[red]%}) '
PROMPT+='%{$fg[yellow]%}%n '
PROMPT+='%{$fg[blue]%}%m '
PROMPT+='%{$fg[magenta]%}%2. '
PROMPT+='%{$fg[green]%}$GITSTATUS_PROMPT'
PROMPT+='%{$fg[red]%}$VIRTUAL_ENV_INDICATOR'
PROMPT+=$'\n' # Second line
PROMPT+='$VI_INDICATOR '
PROMPT+='%k%f%b' # Clean

# vim:foldmarker=foldstart,foldend
