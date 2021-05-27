(module dots.plugins
  {require-macros [macros]})

(packer-use
  :home/druskus/code/telescope-tfg {}
  :elkowar/kmonad.vim {} :elkowar/antifennel-nvim {}
  :rktjmp/lush.nvim {}
  :druskus20/sourcery {:mod "dots.plugins.sourcery"
                       :requires [:rktjmp/lush.nvim]}
;  :lervag/vimtex {:mod "dots.plugins.vimtex"}
  :nvim-telescope/telescope.nvim {:mod "dots.plugins.telescope"
                                  :cmd ["Telescope"]
                                  :requires [:nvim-lua/popup.nvim :nvim-lua/plenary.nvim]}
  :kyazdani42/nvim-web-devicons {}
  :nvim-treesitter/nvim-treesitter {:mod "dots.plugins.treesitter" 
                                    :event ["BufEnter"]
                                    :run ":TSUpdate"}
  :JoosepAlviste/nvim-ts-context-commentstring {:event ["BufEnter"]
                                                :requires [:nvim-treesitter/nvim-treesitter]}
  :nvim-treesitter/playground {:event ["BufEnter"]
                               :requires [:nvim-treesitter/nvim-treesitter]}
  ;:p00f/nvim-ts-rainbow {}
  ;:romgrk/nvim-treesitter-context {}


  ;:code-biscuits/nvim-biscuits {:requires [:nvim-treesitter/nvim-treesitter]
                                ;:event ["BufReadPost"]
                                ;:config #((. (require "nvim-biscuits") :setup) {})}
  :jiangmiao/auto-pairs {}
  :folke/which-key.nvim {}
  ; json query stuff
  ;:gennaro-tedesco/nvim-jqx {:ft ["json"]}
  :Olical/aniseed {:branch "develop"}; :tag "v3.16.0"}
  ;:Olical/aniseed {}; :tag "v3.16.0"}
  ; general purpose lua wrappers for nvim stuff
  :norcalli/nvim.lua {}
  :Famiu/feline.nvim {:mod "dots.plugins.feline"}
  :akinsho/nvim-bufferline.lua {:mod "dots.plugins.bufferline"}
  ;:romgrk/barbar.nvim {:mod "dots.plugins.barbar"}
  :sindrets/diffview.nvim {:cmd ["DiffviewOpen" "DiffviewToggleFiles"]
                           :mod "dots.plugins.diffview"}
  :tweekmonster/startuptime.vim {:cmd ["StartupTime"]}
  :tpope/vim-repeat {}
  :junegunn/goyo.vim {:cmd "Goyo"}
  :lewis6991/gitsigns.nvim {:mod "dots.plugins.gitsigns"}
  :tpope/vim-fugitive {}
  :preservim/nerdcommenter {}
  :godlygeek/tabular {:cmd ["Tabularize"]} ; :Tab /regex can align code on occurrences of the given regex. I.e. :Tab /= aligns all = signs in a block.
  :tpope/vim-surround {}
  :nathanaelkane/vim-indent-guides {} ; Can be toggled using <leader>ig (intent-guides)
  ; <C-n> to select current word. <C-n> to select next occurrence.
  ; with multiple lines selected in Visual mode, <C-n> to insert cursor in each line. I not i to insert in Visual-mode.
  :terryma/vim-multiple-cursors {}
  :mg979/vim-visual-multi {}
  :hauleth/sad.vim {}          ; Use siw instead of ciw. when using . afterwards, will find the next occurrence of the changed word and change it too
  :wellle/targets.vim {}       ; more text objects. IE: cin (change in next parens). generally better handling of surrounding objects.

;  :iamcco/markdown-preview.nvim {:run vim.fn.mkdp#util#install}

  ;:mfussenegger/nvim-dap {:opt true
                          ;:mod "dots.plugins.nvim-dap"}
  ;:nvim-telescope/telescope-dap.nvim {:opt true
                                     ;:requires [:mfussenegger/nvim-dap
                                                ;:nvim-telescope/telescope.nvim]}

  ; code-related ----------------------------------------- <<<

  :ray-x/lsp_signature.nvim {:events [:BufEnter]}
  :folke/lsp-trouble.nvim {:mod "dots.plugins.trouble"
                           :cmd ["Trouble" "TroubleClose" "TroubleRefresh" "TroubleToggle"]}
  :simrat39/symbols-outline.nvim {:mod "dots.plugins.symbols-outline"}
  :neovim/nvim-lspconfig {}

  :hrsh7th/nvim-compe {:mod "dots.plugins.compe"}
 ;  :/home/leon/coding/prs/nvim-compe {:event [:BufEnter]
 ;                                     :mod "dots.plugins.compe"}

  :glepnir/lspsaga.nvim {:mod "dots.plugins.lspsaga"}

  ;; --------------------

  :Olical/conjure {}
  :tami5/compe-conjure {:requires [:Olical/conjure]}
  :ciaranm/detectindent {:mod "dots.plugins.detect-indent"}
  :pechorin/any-jump.vim {}
  :justinmk/vim-sneak {:mod "dots.plugins.sneak"}
  :psliwka/vim-smoothie {}
  :editorconfig/editorconfig-vim {}
  :tommcdo/vim-exchange {}
  ;:frazrepo/vim-rainbow {}

  ;:bhurlow/vim-parinfer {:ft ["fennel" "carp" "lisp" "elisp"]}

  :eraserhd/parinfer-rust {:run "cargo build --release"}
 ;  :bduggan/vim-raku {:ft ["raku"]}
  ; :LnL7/vim-nix {:ft ["nix"]}
  :kevinoid/vim-jsonc {}
  :norcalli/nvim-colorizer.lua {:mod "dots.plugins.nvim-colorizer"}
  :pangloss/vim-javascript {} ; syntax highlighting JS
  :ianks/vim-tsx {}
  :leafgarland/typescript-vim {}
  ;:sheerun/vim-polyglot {:event [:BufEnter]}    ; Syntax highlighting for most languages
  :HerringtonDarkholme/yats.vim {} ; typescript syntax highlighting
  :mxw/vim-jsx {}
  :mattn/emmet-vim {:mod "dots.plugins.emmet"}

;  :purescript-contrib/purescript-vim {}


;  :derekelkins/agda-vim {:ft ["agda"]}
  :neovimhaskell/haskell-vim { :ft ["haskell"]}
  :rust-lang/rust.vim {:ft ["rust"]
                       :requires ["mattn/webapi-vim"]
                       :config #(do (set vim.g.rustfmt_fail_silently 1))}
  :simrat39/rust-tools.nvim {}
  :qnighy/lalrpop.vim {}
;  :edwinb/idris2-vim {:ft ["idris2"]}
;  :vmchale/ats-vim {:ft ["ats" "dats" "sats"]}
  :bakpakin/fennel.vim {}
  :google/vim-jsonnet {})
  
; >>>


; vim:foldmarker=<<<,>>>


