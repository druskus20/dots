#!/bin/zsh

plugins=(
	 #"https://github.com/romkatv/zsh-defer COMMIT_HASH"
	 'https://github.com/zsh-users/zsh-autosuggestions 85919cd1ffa7d2d5412f6d3fe437ebdbeeec4fc5'
	 'https://github.com/zdharma/fast-syntax-highlighting 3bd4aa2450066f86b6a61e0426a50ac8b42061aa'
	 'https://github.com/zsh-users/zsh-history-substring-search 87ce96b1862928d84b1afe7c173316614b30e301'
	 'https://github.com/MichaelAquilina/zsh-you-should-use 64dd9e3ff977e4ae7d024602b2d9a7a4f05fd8f6'
	 'https://github.com/romkatv/powerlevel10k.git 36f3045d69d1ba402db09d09eb12b42eebe0fa3b'
)

for plugin_info in $plugins ; do
	plugin_url=$(echo $plugin_info | cut -d' ' -f1)
	commit_hash=$(echo $plugin_info | cut -d' ' -f2)
	plugin_name=$(basename $plugin_url)
	if [ ! -d "$ZDOTDIR/plugins/$plugin_name" ]; then
		git clone $plugin_url "$ZDOTDIR/plugins/$plugin_name"
		cd "$ZDOTDIR/plugins/$plugin_name"
		git checkout $commit_hash
		cd - > /dev/null
	fi
done
