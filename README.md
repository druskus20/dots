<p align="center">
  <img width="100%" src=".github/cover.svg">
</p>

- [zsh](zsh/.config/zsh)
- [neovim](nvim/.config/nvim)

## Why? 
Having a backup of my config files is generally handy.

## How? 
I use [stow](https://www.gnu.org/software/stow) to manage my dotfiles.


## Programs I use

- **x11**: display server.
- **bspwm**: window manager.
- **sxhkd**: hotkey daemon.
- **picom**: compositor.
- *polybar*: status bar.
- **eww**: status bar, notifications via [tiramisu](https://github.com/Sweets/tiramisu) and widgets.
- *dunst*: notification daemon.
- **alacritty**: terminal.
- **zsh**: shell.
- **rofi**: program launcher. (based on what I yoinked from [elkowar](https://github.com/elkowar))
- **nvim**: editor. (based on what I yoinked from [elkowar](https://github.com/elkowar))
- **gtk**: gui framework.
- **zathura**: pdf viewer.
- **pipr**: a program to test shell pipes interactively.
- **paru**: package manager.
- **flashfocus**: window focus indicator.

## Scripts I use

- **0x0st**: uploads an image to 0x0.st.
- **arch-aur-updates**: checks the number of updates pending.
- **cheat**: gets hints about commands.
- *codefix*: wrapper around vscode in order to declutter home.
- **colorfetch**: prints pretty colors.
- **copy**: copies the contents of a file to the clipboard.
- **createuserdirs**: creates a basic directory structure in ~.
- **cronbat**: sends a notification if the battery is low.
- **cronupdate**: sends a notification if there are updates pending.
- **dlaunch**: program launcher using dmenu.
- **dmount**: mount partitions using dmenu.
- *doted*: access dotfiles quickly using rofi.
- *dots*: wrapper around git in order to use a bare repo for dofile management.
- **dpass**: password prompt using dmenu.
- *firefox*: wrapper around firefox in order to declutter home.
- *lightctrl*: controls the backlight.
- **mans**: manpage selection through rofi.
- **night**: toogles night mode using redshift
- *night-legacy*: toogles night mode.
- **powermenu**: power menu using rofi.
- **scr**: takes a screenshot and copies it to the clipboard and stdout.
- **setbg**: sets the background and caches it (for betterlockscreen).
- **sfetch**: fetches system information.
- **spotify**: wrapper around spotify in order to declutter home.
- *tdaemon*: wrapper around urxvt to run a urxvtd.
- *twitch*: checks live streams and prompts the user using rofi.
- *xobinit*: wrapper around xob.
- *xrdbr*: reloads xresources and generates configs for other programs.
- *xresq*: queries a value in Xresources.
- *yaysync*: downloads fresh yay package databases.

## Other things I use

- **UI Font**: NotoSans Nerd Font
- **Terminal Font**: DejaVu Sans Mono
- **Icon Fonts**: Font Awesome 5 Free & Brands
- **GTK Theme**: [Phocus](https://github.com/phocus)
- **GTK Icon Theme**: Papirus
- **Google Chrome Theme**: My own, (chrome-theme)

## See also
[eugh](https://github.com/druskus20/eugh)

[ora](https://github.com/druskus20/ora)

## TODO
- [x] Look into Jsonnet to: split configs between multiple machines, have unified colors...
- [ ] Switch to xmonad (or wayland... if ~~nvidia~~ sway wants...)
- [x] Redo zsh config
- [x] Redo nvim config using fennel
- [x] Create eww config, replace dunst (?), polybar (?)...
- [x] Migrate scripts to rofi
