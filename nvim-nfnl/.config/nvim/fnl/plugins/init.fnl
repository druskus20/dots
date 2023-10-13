; loaded by ../../init.lua
; https://github.com/lazyvim/lazyvim/blob/a72a84972d85e5bbc6b9d60a0983b37efef21b8a/lua/lazyvim/plugins/core.lua

(require :config.options)


; load autocmds and keymaps lazily
; https://github.com/LazyVim/LazyVim/blob/e8c26c70e27d468cec11926890105d61f99f9218/lua/lazyvim/config/init.lua#L20
; used to use "M.load()" https://github.com/LazyVim/LazyVim/blob/a72a84972d85e5bbc6b9d60a0983b37efef21b8a/lua/lazyvim/config/init.lua#L139
(local lazy_autocmds (= (vim.fn.argc -1) 0)) 
(if (not lazy_autocmds)
  (require :config.autocmds))
(vim.api.nvim_create_autocmd :User {:callback 
                                      (fn [] 
                                        (if lazy_autocmds 
                                          (require :config.autocmds))
                                        (require :config.user_keys)
                                        (require :config.user_colors))
                                    :group (vim.api.nvim_create_augroup :LazyVim {:clear true}) :pattern :VeryLazy})

[
  {1 :folke/lazy.nvim :version "*"}
  ; https://github.com/LazyVim/LazyVim/blob/e8c26c70e27d468cec11926890105d61f99f9218/lua/lazyvim/plugins/extras/coding/copilot.lua#L56
  {1 :github/copilot.vim :event :VeryLazy}
  ;{1 :rust-lang/rust.vim}
  ;{1 :simrat39/rust-tools.nvim}
  
  {1 :eraserhd/parinfer-rust :build "cargo build --release" :ft [:fennel :lisp]}
  {1 :elkowar/yuck.vim :ft [:yuck]}
  ;{1 :elkowar/antifennel-nvim :lazy true :cmd ["Antifennel"]} ; -- aniseed

  {1 :nvim-tree/nvim-web-devicons 
     :event :VeryLazy 
     :config true
     :opts { :color_icons true :default false :override { :fnl { :icon  "󰬍" :color  "#428850" :cterm_color  "230" :name "Fennel"}}}}

  {1 :antifennel :dir "~/antifennel.nvim" :config true}

  {1 :karb94/neoscroll.nvim 
     :event :VeryLazy
     :config (fn [_ opts] 
               ((. (require :neoscroll) :setup) opts) ; TODO: NOT WORKING
               (let [m { :<C-u> [:scroll [:-vim.wo.scroll :1 :true]]
                         :<C-d> [:scroll [:vim.wo.scroll :true :1]]}]
                 (. (require :neoscroll.config) :set_mappings) m))
               
               

                

              
               
     :opts {:easing_function :sine}
     :version "*"}]
   

