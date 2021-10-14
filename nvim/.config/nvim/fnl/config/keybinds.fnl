; keybinds.fnl
; Set up keybinds **and which-key** 

(module config.keybinds
  {autoload {nvim aniseed.nvim
             wk which-key}
   require-macros [config.macros]})


(utils.keymap :n :<C-p> ":Telescope find_files<CR>")

(vim-let mapleader "\\<Space>")
(vim-let maplocalleader ",")

(wk.setup {})
(wk.register 
  {:f {:b {1 (fn []
              (print :bar))
           2 :Foobar}
       :f {1 "<cmd>Telescope find_files<cr>" 2 "Find File"}
       :1 :which_key_ignore
       :n {1 "New File"}
       :name :file
       :e "Edit File"}}
  {:prefix :<leader>})


(set nvim.o.timeoutlen 200)
