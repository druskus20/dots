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
  :lewis6991/impatient.nvim {} 
  :Olical/aniseed {:opt false}
  :Olical/conjure {} 
  :Olical/nvim-local-fennel {}


  ; lsp stuff
  :neovim/nvim-lspconfig {:config (mod :lsp)}
;  :ray-x/lsp_signature.nvim {:config (mod :lsp-signature) :events [:BufEnter]}
  :ray-x/lsp_signature.nvim {:config (mod :lsp-signature)}
  ;:tami5/lspsaga.nvim {:config (mod :lspsaga)}

  :tami5/lspsaga.nvim {:config (mod :lspsaga)}
  :weilbith/nvim-code-action-menu {}

  ;:Saecki/crates.nvim {:requires [:nvim-lua/plenary.nvim]
  ;                     :event ["BufRead Cargo.toml"]
  ;                     :config (setup :crates)

  :hrsh7th/vim-vsnip {}

  ; cmp stuff
  :PaterJason/cmp-conjure {}
  ;:hrsh7th/cmp-vsnip {}
  :hrsh7th/cmp-nvim-lsp {} ; Configured in plguins/lsp.fnl
  :hrsh7th/cmp-buffer {}
  :hrsh7th/cmp-path {}
  :hrsh7th/cmp-nvim-lua {}
  :hrsh7th/cmp-calc {}
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

  ;:ms-jpq/coq_nvim {:opt false :config (mod :coq)}

  :lewis6991/gitsigns.nvim {:opt false :config (mod :gitsigns)}
  :kyazdani42/nvim-web-devicons {}
  :folke/todo-comments.nvim {:config (mod :todo-comments)}
  ;:folke/twilight.nvim {:config (mod :twilight)} 
  :benstockil/twilight.nvim {:config (mod :twilight)} ; Fix black bg
  :folke/zen-mode.nvim {:after [:gitsigns.nvim] :config (mod :zen-mode)}
  
  :nvim-telescope/telescope.nvim {:cmd ["Telescope"]
                                  :config (mod :telescope)
                                  :requires [:nvim-lua/popup.nvim :nvim-lua/plenary.nvim]} ; change how it looks but yes

  :folke/which-key.nvim {} ; Config is in config/keybinds.fnl
  :norcalli/nvim-colorizer.lua {:config (mod :colorizer)} ; I do want one of those
  :tpope/vim-surround {} 
  :folke/trouble.nvim {:config (mod :trouble)}
  ;:folke/trouble.nvim {:cmd ["Trouble" "TroubleToggle"] :config (mod :trouble)}
  :Famiu/feline.nvim {:opt false :config (mod :feline)}
  :akinsho/nvim-bufferline.lua {:opt false :config (mod :bufferline)}
  :tweekmonster/startuptime.vim {:cmd ["StartupTime"]} 
  :eraserhd/parinfer-rust {:run "cargo build --release"}
  ;:druskus20/sourcery-lush {:opt false :requires [:rktjmp/lush.nvim] :config (mod :sourcery)}
  ;:folke/tokyonight.nvim {}
  ;:druskus20/sourcery.nvim {:config #(vim.cmd "colorscheme sourcery")} 
  :/home/druskus/code/sourcery.nvim {:config #(vim.cmd "colorscheme sourcery")} 
  ;:mcchrish/zenbones.nvim {} 
  :folke/persistence.nvim {:config (mod :persistence)}
  ;:druskus20/dashboard-nvim {:config (mod :dashboard)}
  :rust-lang/rust.vim {:ft ["rust"]
                       :config #(do (set vim.g.rustfmt_fail_silently 1))
                       :requires ["mattn/webapi-vim"]}

  :simrat39/rust-tools.nvim {:config (mod :rust-tools) 
                             :requires ["nvim-lua/popup.nvim" "nvim-lua/plenary.nvim"]}
  ;:mg979/vim-visual-multi {} interesting
  :elkowar/yuck.vim {:ft ["yuck"]}
  :elkowar/antifennel-nvim {}
  :jiangmiao/auto-pairs {}
  :preservim/nerdcommenter {}
  :godlygeek/tabular {}
  :tpope/vim-repeat {}

  :justinmk/vim-sneak {:config (mod :sneak)}
  :ciaranm/detectindent {:config (mod :detectindent)}
  :pechorin/any-jump.vim {}
  :psliwka/vim-smoothie {}
  :editorconfig/editorconfig-vim {}
  :jbyuki/instant.nvim {:config (mod :instant)}
  :luukvbaal/stabilize.nvim { :config (setup :stabilize)}
  :simrat39/symbols-outline.nvim {:cmd ["SymbolsOutline"]}
  :rhysd/conflict-marker.vim {}
  :wfxr/minimap.vim {}
  :github/copilot.vim {}
  :bfrg/vim-cpp-modern {}
  :druskus20/dostack.vim {})
  ;:/home/druskus/code/dostack.vim {})
  ;:kmonad/kmonad-vim {})
  
; foldend                                                                                   

; https://github.com/lewis6991/impatient.nvim#installation
(require "packer_compiled")

; TODO Set up nvim dap / rust tools dap 

; vim:foldmarker=foldstart,foldend
