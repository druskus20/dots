#!/bin/sh

dotfiles_root="$HOME"


printf "{"

for source_path in $(find dotfiles -type f | grep -v ".gitignore"); do
  
  program_name="$(echo "$source_path" | sed 's|^/\?[^/]*/\([^/]*\)/.*$|\1|')"
#########  source_path="$(echo "$source_path" | sed 's|^/\?[^/]*/[^/]*/||')"
  dest_path="$dotfiles_root/$source_path"
  
  if [ -z "$last_program_name" ]; then
    printf "\t%s: {\n" "'$program_name'"
  elif [ "$program_name" != "$last_program_name" ]; then
    printf "\t},\n"
    printf "\t%s: {\n" "$program_name"
  fi
  printf "\t\t'%s': importstr '%s',\n" "$dest_path" "$source_path"

  last_program_name="$program_name"

done

printf "\t},\n"
printf "}"
