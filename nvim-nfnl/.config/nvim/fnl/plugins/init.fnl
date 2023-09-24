; loaded by ../../init.lua
; https://github.com/lazyvim/lazyvim/blob/a72a84972d85e5bbc6b9d60a0983b37efef21b8a/lua/lazyvim/plugins/core.lua

(require :config.options)

; load autocmds and keymaps lazily
; https://github.com/LazyVim/LazyVim/blob/a72a84972d85e5bbc6b9d60a0983b37efef21b8a/lua/lazyvim/config/init.lua#L105
; used to use "M.load()" https://github.com/LazyVim/LazyVim/blob/a72a84972d85e5bbc6b9d60a0983b37efef21b8a/lua/lazyvim/config/init.lua#L139
(if (= (vim.fn.argc (- 1)) 0)
    ; autocmds and keymaps can wait to load
    (vim.api.nvim_create_autocmd :User
                                 {:callback 
                                    (fn [] (require :config.autocmds)
                                           (require :config.user_keys)
                                  :group (vim.api.nvim_create_augroup :LazyVim {:clear true})
                                  :pattern :VeryLazy})
    ; otherwise load them now. so they affect the opened buffers
    (do (require :config.autocmds) (require :config.user_keys)))	

[{1 :folke/lazy.nvim :version "*"}]


