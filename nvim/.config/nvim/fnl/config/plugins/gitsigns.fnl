(module config.plugins.gitsigns
  {autoload {utils config.utils
             colors config.colors
             gitsigns gitsigns}})


;  https://github.com/lewis6991/gitsigns.nvim
(gitsigns.setup 
  {:signs {:add          {:text "▍"}
           :change       {:text "▍"}
           :delete       {:text "▍"}
           :topdelete    {:text "▍"}
           :changedelete {:text "▍"}}
   :keymaps {:noremap true 
             :buffer true}
   :current_line_blame false
   :update_debounce 50}) ; less than usual 


; TODO Change
;(vim.cmd
;  (..
;    "
;    augroup gitsignsHighlight
;    autocmd ColorScheme * :hi! GitSignsAdd    gui='NONE' guibg='NONE' guifg='" colors.bright_purple "'
;    autocmd ColorScheme * :hi! GitSignsDelete gui='NONE' guibg='NONE' guifg='" colors.bright_red "'
;    autocmd ColorScheme * :hi! GitSignsChange gui='NONE' guibg='NONE' guifg='" colors.bright_aqua "'
;    augroup END
;    "))
