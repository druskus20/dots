source /usr/share/gitstatus/gitstatus.plugin.zsh

autoload -U colors && colors

# This allows expansions
setopt PROMPT_SUBST

# Updates editor information when the keymap changes.
function zle-line-init zle-keymap-select {
    case $KEYMAP in
      vicmd)      VI_INDICATOR="NORMAL"   ;;
      main|viins) VI_INDICATOR="INSERT"   ;;
    esac
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# https://github.com/romkatv/gitstatus/blob/master/gitstatus.prompt.zsh
function gitstatus_prompt_update() {
  emulate -L zsh
  typeset -g  GITSTATUS_PROMPT=''

# Call gitstatus_query synchronously. Note that gitstatus_query can also be called
  # asynchronously; see documentation in gitstatus.plugin.zsh.
  gitstatus_query 'MY'                  || return 1  # error
  [[ $VCS_STATUS_RESULT == 'ok-sync' ]] || return 0  # not a git repo
  
  local cl="%{$fg[black]%}" # green foreground
  local mo="%{$fg[black]%}" # yellow foreground
  local un="%{$fg[black]%}" # blue foreground
  local co="%{$fg[black]%}" # red foreground

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
  # 'merge' if the repo is in an unusual state.
  [[ -n $VCS_STATUS_ACTION     ]] && p+=" ${co}${VCS_STATUS_ACTION}"
  # ~42 if have merge conflicts.
  (( VCS_STATUS_NUM_CONFLICTED )) && p+=" ${co}~${VCS_STATUS_NUM_CONFLICTED}"
  # +42 if have staged changes.
  (( VCS_STATUS_NUM_STAGED     )) && p+=" ${mo}+${VCS_STATUS_NUM_STAGED}"
  # !42 if have unstaged changes.
  (( VCS_STATUS_NUM_UNSTAGED   )) && p+=" ${mo}!${VCS_STATUS_NUM_UNSTAGED}"
  # ?42 if have untracked files. It's really a question mark, your font isn't broken.
  (( VCS_STATUS_NUM_UNTRACKED  )) && p+=" ${un}?${VCS_STATUS_NUM_UNTRACKED}"

  GITSTATUS_PROMPT="  ${p}%f"
}

# Start gitstatusd instance with name "MY". The same name is passed to
# gitstatus_query in gitstatus_prompt_update. The flags with -1 as values
# enable staged, unstaged, conflicted and untracked counters.
gitstatus_stop 'MY' && gitstatus_start -s -1 -u -1 -c -1 -d -1 'MY'

# On every prompt, fetch git status and set GITSTATUS_PROMPT.
autoload -Uz add-zsh-hook
add-zsh-hook precmd gitstatus_prompt_update

# Disable default virtualenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1 

# This needs to be in simple quotes
# https://unix.stackexchange.com/questions/32124/set-variables-in-zsh-precmd-and-reference-them-in-the-prompt
PROMPT='%B'
PROMPT+='%F{black}%K{magenta}$VI_INDICATOR'
PROMPT+='%F{magenta}%K{green}'
PROMPT+='%F{black}%(?:%K{green} ✓%F{green}%K{yellow}:%K{red} ✕%F{red}%K{yellow})'
PROMPT+='%F{black}%n'
PROMPT+='%F{yellow}%K{blue}'
PROMPT+='%F{black}%m'
PROMPT+='%F{blue}%K{magenta}'
PROMPT+='%F{black}%K{magenta}%2.'
PROMPT+='$GITSTATUS_PROMPT'
PROMPT+='%F{magenta}'
PROMPT+='${VIRTUAL_ENV##*/}'
PROMPT+='%k%b%f '
