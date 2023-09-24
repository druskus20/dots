(local opts {:style :day})


[{1 :folke/tokyonight.nvim 
    :enabled false
    :config (fn []
                 ((. (require :tokyonight) :setup) opts)
                 (vim.cmd "colorscheme tokyonight"))
    :lazy false }]	
