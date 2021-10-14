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
;; Plugins to be managed by packer.
(use
  :lewis6991/impatient.nvim {} ; try
  :Olical/aniseed {:opt false}
  :Olical/conjure {} ; test

  ; lsp stuff
  :neovim/nvim-lspconfig {:config (mod :lsp)}
  :ray-x/lsp_signature.nvim {:events [:BufEnter]}
  :tami5/lspsaga.nvim {:config (mod :lspsaga)}


  :Saecki/crates.nvim {:requires [:nvim-lua/plenary.nvim]
                       :event ["BufRead Cargo.toml"]
                       :config (setup :crates)}
  :hrsh7th/vim-vsnip {}

  ; cmp stuff
  :PaterJason/cmp-conjure {}
  :hrsh7th/cmp-vsnip {}
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
                                :hrsh7th/cmp-vsnip
                                :hrsh7th/cmp-nvim-lua
                                :hrsh7th/cmp-calc
                                :hrsh7th/cmp-path
                                :Saecki/crates.nvim]} ; TODO TEST

  ;:ms-jpq/coq_nvim {:opt false :config (mod :coq)}

  :lewis6991/gitsigns.nvim {:opt false :config (mod :gitsigns)}
  :kyazdani42/nvim-web-devicons {}

  :folke/twilight.nvim {:config (mod :twilight)}
  :folke/zen-mode.nvim {:after [:gitsigns.nvim] :config (mod :zen-mode)}
  
  :nvim-telescope/telescope.nvim {:cmd ["Telescope"]
                                  :config (mod :telescope)
                                  :requires [:nvim-lua/popup.nvim :nvim-lua/plenary.nvim]} ; change how it looks but yes
  ;:Olical/nvim-local-fennel {}
  ;:Olical/vim-enmasse {} ; interesting, edit in quickfix windows
  ;:PeterRincker/vim-argumentative {} ; interesing, navigation through arguments
  ;:airblade/vim-gitgutter {}
  ;:easymotion/vim-easymotion {:mod :easymotion} ; I want one of theese
  :folke/which-key.nvim {} ; Config is in config/keybinds.fnl
  ;:guns/vim-sexp {:mod :sexp} ; interesting lisp editing
  ;:jiangmiao/auto-pairs {:mod :auto-pairs} ; auto closing parents
  ;:liuchengxu/vim-better-default {:mod :better-default} ; dont want this, but interesting to look at
  :norcalli/nvim-colorizer.lua {:config (mod :colorizer)} ; I do want one of those
  ;:radenling/vim-dispatch-neovim {} ; dont think I want this
  ;:tami5/compe-conjure {} ; yes but cmp conjure
  ;:tpope/vim-abolish {} ; dont think so?
  ;:tpope/vim-commentary {} ; one of theese?
  ;:tpope/vim-repeat {} ; do I want this????
  ;:tpope/vim-sexp-mappings-for-regular-people {} ; might be nice
  ;:tpope/vim-sleuth {} ; auto detect indentation, probably yes
  ;:tpope/vim-surround {} ; YE
  ;:tpope/vim-unimpaired {} ; Dont think so?
  ;:tpope/vim-vinegar {} ; might be interesting to try
  :Famiu/feline.nvim {:opt false :config (mod :feline)}
  :akinsho/nvim-bufferline.lua {:opt false :config (mod :bufferline)}
  :tweekmonster/startuptime.vim {} ; ye
  :eraserhd/parinfer-rust {:run "cargo build --release"}
  :druskus20/sourcery {:opt false :requires [:rktjmp/lush.nvim] :config (mod :sourcery)}
  ;:/home/druskus/code/sourcery {:opt false :requires [:rktjmp/lush.nvim] :config (mod :sourcery)}
  ;:mcchrish/zenbones.nvim {} 
  ;:w0rp/ale {:mod :ale} ; dont think so? errors and stuff

  ;:druskus20/dashboard-nvim {:config (mod :dashboard)}
  :rust-lang/rust.vim {:ft ["rust"]
                       :config #(do (set vim.g.rustfmt_fail_silently 1))
                       :requires ["mattn/webapi-vim"]}
                                  
  :simrat39/rust-tools.nvim {:requires ["nvim-lua/popup.nvim" "nvim-lua/plenary.nvim"]}
  ;:mg979/vim-visual-multi {} interesting
  :elkowar/antifennel-nvim {})
; foldend                                                                                   

; https://github.com/lewis6991/impatient.nvim#installation
(require "packer_compiled")

; vim:foldmarker=foldstart,foldend
