# zsh 

## Installation
I install zsh via pacman:
```sh
sudo pacman -S zsh
```
I also set a custom path for zsh's config files. Might be necessary to logout.
```sh
sudo echo 'ZDOTDIR="$HOME"/.config/zsh' >> /etc/zsh/zshenv
```
I dont use a plugin manager, I manage my plugins with paru / pacman. The zsh plugins are therefore installed in /usr/share/zsh.
```sh
paru -S \
zsh-autosuggestions \
zsh-completions \
zsh-fast-syntax-highlighting \
zsh-history-substring-search \
zsh-you-should-use

# Regenerate completions after installing zsh-completions
rm ~/.config/zsh/.zcompdump && compinit
```

My prompt also uses gitstatus (gitstatus-bin).
```sh 
paru -S gitstatus-bin
```



## Structure
The config is structured in the following way: 
* .zshrc: This file is sourced in interactive shells. It serves as the root of the config.
* .zlogin: This file is sourced in login shells, after .zshrc.
* .zprofile: This file is sourced in login shells, before .zshrc.
* modules: Contains different parts of my config: keybinds, prompt, aliases...
* plugins: May contain specific plugin configs that get loaded at startup.
* utils: Contains different utility functions.

## Vi mode
I use zsh's vi-mode, it comes with several inconveniences that I attempt to fix in modules/keybinds.zsh.
See [this post](https://superuser.com/questions/476532/how-can-i-make-zshs-vi-mode-behave-more-like-bashs-vi-mode).

## Why not use a plugin manager
I've tried oh-my-zsh aswell as zplug in the past. Both resulted in
noticeable slower startup times. Because I dont have many plugins, I dont
feel the need to use any plugin manager. 

