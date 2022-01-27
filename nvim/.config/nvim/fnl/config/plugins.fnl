; plugins.fnl
; Load plugins and it's respective configs from plugins/*

(module config.plugins
  { autoload {a aniseed.core
              packer packer}})

; Utils foldstart                                                                 
(macro mod [name]
  `#(require ,(.. "config.plugins." name)))

(macro setup [name]
  `#((. (require ,name) :setup)))

; Taken from https://github.com/Olical/dotfiles/blob/master/stowed/.config/nvim/fnl/dotfiles/plugin.fnl#L12
(defn safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :dotfiles.plugin. name))]
    (when (not ok?)
      (print (.. "dotfiles error: " val-or-err)))))

(defn use [...]
  (let [pkgs [...]]
    (packer.startup
      {1 (fn [use]
           (for [i 1 (a.count pkgs) 2]
             (let [name (. pkgs i)
                   opts (. pkgs (+ i 1))]
               (use (a.assoc opts 1 name)))))
      ; https://github.com/lewis6991/impatient.nvim#installation
       :config {:compile_path (.. (vim.fn.stdpath "config") "/lua/packer_compiled.lua")}})))
; foldend                                                                 

; Plugins foldstart                                                                   
(use
  ;;; Basic
  :Olical/aniseed {:opt false}
  :Olical/conjure {} 
  :Olical/nvim-local-fennel {}
  :lewis6991/impatient.nvim {} 

  ;;; Lsp ;;;
  :neovim/nvim-lspconfig {:config (mod :lsp)}
  :simrat39/rust-tools.nvim {:config (mod :rust-tools) 
                             :requires ["nvim-lua/popup.nvim" "nvim-lua/plenary.nvim" "mfussenegger/nvim-dap"]}
  :https://github.com/rcarriga/nvim-dap-ui {:config (mod :dap-ui)
                                            :requires ["mfussenegger/nvim-dap"]}
  :ray-x/lsp_signature.nvim {:config (mod :lsp-signature)}
  :tami5/lspsaga.nvim {:config (mod :lspsaga)}
  ;:weilbith/nvim-code-action-menu {}


  ;;; Completions ;;;
  :hrsh7th/vim-vsnip {}
  :github/copilot.vim {}
  ;:ms-jpq/coq_nvim {:opt false :config (mod :coq)}
  :hrsh7th/cmp-nvim-lsp {} ; Configured in plguins/lsp.fnl
  :hrsh7th/cmp-buffer {}
  :PaterJason/cmp-conjure {}
  ;:hrsh7th/cmp-vsnip {}
  :hrsh7th/cmp-nvim-lua {}
  :hrsh7th/cmp-calc {}
  :hrsh7th/cmp-path {}
  :hrsh7th/nvim-cmp {:opt false 
                     :config (mod :cmp)
                     :requires [:hrsh7th/cmp-nvim-lsp 
                                :hrsh7th/cmp-buffer
                                :hrsh7th/cmp-conjure
  ;                              :hrsh7th/cmp-vsnip
                                :hrsh7th/cmp-nvim-lua
                                :hrsh7th/cmp-calc
                                :hrsh7th/cmp-path
                                :Saecki/crates.nvim]} 

  :nvim-treesitter/nvim-treesitter {:config (mod :treesitter) 
                                    :event ["BufEnter"]
                                    :run ":TSUpdate"}

  ;;; Visual ;;;
  :rhysd/conflict-marker.vim {}
  :lewis6991/gitsigns.nvim {:opt false :config (mod :gitsigns)}
  :kyazdani42/nvim-web-devicons {}
  :folke/todo-comments.nvim {:config (mod :todo-comments)}
  :folke/which-key.nvim {} ; Config is in config/keybinds.fnl
  :norcalli/nvim-colorizer.lua {:config (mod :colorizer)} ; I do want one of those
  :Famiu/feline.nvim {:opt false :config (mod :feline)}
  :akinsho/nvim-bufferline.lua {:opt false :config (mod :bufferline)}
  :psliwka/vim-smoothie {}
  :wfxr/minimap.vim {}
  :luukvbaal/stabilize.nvim { :config (setup :stabilize)}
  :lukas-reineke/indent-blankline.nvim { :config (mod :indent-blankline)}
  ;:druskus20/dashboard-nvim {:config (mod :dashboard)}
  ;:mg979/vim-visual-multi {} interesting
  ;:nathanaelkane/vim-indent-guides {:cmd ["IndentGuidesToggle"]}


  ;;; Navigation ;;;
  :pechorin/any-jump.vim {}
  :simrat39/symbols-outline.nvim {:cmd ["SymbolsOutline"]}
  :justinmk/vim-sneak {:config (mod :sneak)}
  :nvim-telescope/telescope.nvim {:cmd ["Telescope"]
                                  :config (mod :telescope)
                                  :requires [:nvim-lua/popup.nvim :nvim-lua/plenary.nvim]} ; change how it looks but yes
  :folke/trouble.nvim {:config (mod :trouble)}
  ;:folke/trouble.nvim {:cmd ["Trouble" "TroubleToggle"] :config (mod :trouble)}


  ;;; Modes ;;;
  :benstockil/twilight.nvim {:config (mod :twilight)} ; Fix black bg
  :folke/zen-mode.nvim {:after [:gitsigns.nvim] :config (mod :zen-mode)}
  

  ;;; Colorscheme ;;;
  :/home/druskus/code/sourcery.nvim {:config #(vim.cmd "colorscheme sourcery")} 
  ;:folke/tokyonight.nvim {}
  ;:mcchrish/zenbones.nvim {} 
  ;:druskus20/sourcery.nvim {:config #(vim.cmd "colorscheme sourcery")} 
  ;:druskus20/sourcery-lush {:opt false :requires [:rktjmp/lush.nvim] :config (mod :sourcery)}


  ;;; Language Specific ;;;
  :rust-lang/rust.vim {:ft ["rust"]
                       :config #(do (set vim.g.rustfmt_fail_silently 1))
                       :requires ["mattn/webapi-vim"]}
  :Saecki/crates.nvim {:requires ["nvim-lua/plenary.nvim"]
                       :event ["BufRead Cargo.toml"]
                       :config (setup :crates)}
  :elkowar/yuck.vim {:ft ["yuck"]}
  :elkowar/antifennel-nvim {}
  :bfrg/vim-cpp-modern {}
  :qnighy/lalrpop.vim {}
  :druskus20/dostack.vim {}
  ;:editorconfig/editorconfig-vim {}
  ;:kmonad/kmonad-vim {}


  ;;; Misc ;;;
  :tweekmonster/startuptime.vim {:cmd ["StartupTime"]} 
  :folke/persistence.nvim {:config (mod :persistence)}
  ;:jbyuki/instant.nvim {:config (mod :instant)})
  :tpope/vim-surround {} 
  :tpope/vim-sleuth {}
  ;:ciaranm/detectindent {:config (mod :detectindent)}
  :jiangmiao/auto-pairs {}
  :eraserhd/parinfer-rust {:run "cargo build --release"}
  :godlygeek/tabular {:cmd ["Tabularize"]}
  :preservim/nerdcommenter {}
  :tpope/vim-repeat {})
; foldend                                                                                   

; https://github.com/lewis6991/impatient.nvim#installation
(require "packer_compiled")

; vim:foldmarker=foldstart,foldend
