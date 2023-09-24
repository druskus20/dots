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
