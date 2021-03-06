<h1 align="center">Neovim</h1>

<p align="center">
    <img width="700" src=".github/vim-showcase.gif">
</p>

I use [Neovim](https://neovim.io) as my editor. Since version 0.5 it
supports configuration through Lua. Lua is much faster than vimscript, and,
even if its syntax isn't perfect, its still much better. On top of that I
decided to use [Aniseed](https://github.com/Olical/aniseed), which allows me to
configure nvim using [Fennel](https://fennel-lang.org/).

## Some features
* LSP integration
* Fast loading through [Packer](https://github.com/wbthomason/packer.nvim) and [impatient-nvim](https://github.com/lewis6991/impatient.nvim)
* Comfortable navigation
* Aesthetically pleasing

## Changelog 
These are (some of) the changes that I've been making
- 29-01-2022: Fixed bufferline's inconsistent separators
- 27-01-2022: Support nvim-dap with nvim-dap-ui
- 26-01-2022: Indentation guidelines
- 09-12-2021: Added range_code_action keybinds
- 09-12-2021: Added lsp_signature for function signature hints
- 09-12-2021: Reversed the order of lsp diagnostics
- 09-12-2021: Disabled cmp-vsnip


## Installation
Install neovim's latest version through the AUR.
``` 
paru -S neovim 
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
its Lua counterpart in `./lua`. So basically, we just need a small `init.lua`
file to load aniseed for us. That's it, that's all the Lua we need to touch.

## Neovim is broken, how fix? 

Oh no... You're on your own. I suggest removing `~/.local/share/nvim/site/pack`
and `./lua`, and then reinstalling everything as shown in
[Installation](https://github.com/Olical/aniseed#installation).

## Some interesting plugins
* [impatient-nvim](https://github.com/lewis6991/impatient.nvim): Boosts startup performance
* [feline](https://github.com/famiu/feline.nvim): A solid statusline
* [which-key](https://github.com/folke/which-key.nvim): Keybind hints 
* [zen-mode](https://github.com/folke/zen-mode.nvim): A Zen Mode that doesn't destroy your styles
* [twilight](https://github.com/folke/twilight.nvim): Dims inactive portions of the code 
* [parinfer-rust](https://github.com/eraserhd/parinfer-rust): The future of lisp programming

## Useful resources
* [Fennel Reference](https://fennel-lang.org/reference)
* [Nvim Lua Guide](https://github.com/nanotee/nvim-lua-guide)

## To Do
* [ ] Redo Colorscheme 
* [x] which-key and keymaps
* [x] Navigation
* [x] Redo Lsp
* [x] Fix a gitsigns for feline
* [x] Bufferline styling
* [x] Completion
* [x] Dap
* [x] Guidelines
* [ ] Floating Symbols navigator (Telescope + SymbolsOutline)
* [ ] Code Lenses
* [x] Fix bufferline's inconsistencies
* [x] ZenMode and Twilight
