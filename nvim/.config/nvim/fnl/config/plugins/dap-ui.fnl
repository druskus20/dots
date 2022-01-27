(module config.plugins.dap-ui
  {autoload {dapui dapui}})

(dapui.setup {})

(dapui.setup 
  {:tray {:position :bottom
          :elements {1 :repl}
          :size 3}
   :sidebar {:position :left
             :elements {1 {:size 0.61 :id :scopes}
                        2 {:size 0.13 :id :breakpoints}
                        3 {:size 0.13 :id :stacks}
                        4 {:size 0.13 :id :watches}}
             :size 40}})




; not working entirely
;(vim.cmd "autocmd Filetype dap-repl set laststatus=0")
;(vim.cmd "autocmd Filetype dapui-watches set laststatus=0")
;(vim.cmd "autocmd Filetype dapui_scopes set laststatus=0")
;(vim.cmd "autocmd Filetype dapui_breakpoints set laststatus=0")
;(vim.cmd "autocmd Filetype dapui_stacks set laststatus=0")
