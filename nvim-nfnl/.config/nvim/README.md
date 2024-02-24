
Inspired on Folke's LazyVim
* https://github.com/LazyVim/LazyVim
* https://github.com/LazyVim/LazyVim/blob/main/LICENSE

Note: currently cargo and make are required as dependencies but are not included with this command

```
docker run -w /root -it --rm alpine:edge sh -uelic '
  apk add git neovim ripgrep alpine-sdk --update
  git clone https://github.com/druskus20/dots ~/.config/dots
  mv ~/.config/dots/nvim-nfnl/.config/nvim ~/.config/nvim
  cd ~/.config/nvim
  nvim
  nvim
'
```
