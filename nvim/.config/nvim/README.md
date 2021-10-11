# nvim 

[Neovim](https://neovim.io) is my editor of choice. Since version 0.5 it
supports configuration through lua. Lua is much faster than vimscript, and,
even if its syntax isnt perfect, its still much better. On top of that I
decided to use [Aniseed](https://github.com/Olical/aniseed), which allows me to
configure nvim using [Fennel](https://fennel-lang.org/).

## Some features
* LSP integration
* Fast loading through [Packer](https://github.com/wbthomason/packer.nvim) and [impatient-nvim](https://github.com/lewis6991/impatient.nvim)
* Comfortable navigation
* Aesthetically pleasing

## Instalation
My distro of choice is Arch Linux, I've not tested this config in any other
systems other than my own. 

Install neovim's latest version through the AUR (or build it from git ig?).
``` 
paru -S neovim-nightly-vim
```

Put this config in `$XDG_CONFIG_HOME/nvim`. Then open `nvim` and run the
following Vim command: 
``` 
:PackerSync
```
Alternatively you can run:
``` 
chmod +x ./sync.sh && ./sync.sh
```

Restart the editor and... done!

## Structure

The structure is the following:

```
.
├── fnl                   
│   ├── config             
│   │   ├── colors.fnl    # Colors used across the config
│   │   ├── core.fnl      # Main settings 
│   │   ├── keybinds.fnl  # Keymaps and which-key configuration
│   │   ├── macros.fnl    # Various macros 
│   │   ├── plugins       # Plugin specific configurations
│   │   │   └── ...        
│   │   ├── plugins.fnl   # Plugin manager configuration 
│   │   └── utils.fnl     # Various functions 
│   └── init.fnl          # Sources other modules 
└── init.lua              # Boostraps the rest of the config
```

## How does Aniseed work?

Aniseed "bridges the gap between Fennel and Lua". It does, among other things,
by compiling the Fennel code and generating 
its lua counterpart in `./lua`. So basically, we just need a small `init.lua`
file to load aniseed for us. That's it, that's all the lua we need to touch.

## Neovim is broken, how fix? 

Oh no... You're on your own. I suggest removing `~/.local/share/nvim/site/pack`
and `./lua`, and then reinstalling everything as shown in
[Installation](https://github.com/Olical/aniseed#installation).

## Some interesting plugins
* [impatient-nvim](https://github.com/lewis6991/impatient.nvim): Boosts startup performance
* [feline](https://github.com/famiu/feline.nvim): A solid statusline
* [which-key](https://github.com/folke/which-key.nvim): Keybind hints 
* [zen-mode](https://github.com/folke/zen-mode.nvim): A Zen Mode that doesnt destroy your styles
* [twilight](https://github.com/folke/twilight.nvim): Dims inactive portions of the code 
* [parinfer-rust](https://github.com/eraserhd/parinfer-rust): The future of lisp programming

## Useful resources
* [Fennel Reference](https://fennel-lang.org/reference)
* [Nvim Lua Guide](https://github.com/nanotee/nvim-lua-guide)

## To Do
* Colors 
* which-key and keymaps
* Navigation
* Redo Lsp
* Fix a gitsigns for feline
* Bufferline styling
* Completion

