#!/bin/zsh

plugins=( 
	 'https://github.com/zsh-users/zsh-autosuggestions'
	 'https://github.com/zdharma/fast-syntax-highlighting'
	 'https://github.com/zsh-users/zsh-history-substring-search'
	 'https://github.com/MichaelAquilina/zsh-you-should-use'
	 'https://github.com/romkatv/gitstatus'
)

for plugin in $plugins ; do
	plugin_name=$(basename $plugin)
	if [ ! -d "$ZDOTDIR/plugins/$plugin_name" ]; then
		git clone $plugin "$ZDOTDIR/plugins/$plugin_name"
	fi
done
