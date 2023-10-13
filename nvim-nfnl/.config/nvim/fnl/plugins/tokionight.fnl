
[{1 :folke/tokyonight.nvim 
    :enabled false
    :opts {:style :day}
    :config (fn [_ opts]
                ((. (require :tokyonight) :setup) opts)
                (vim.cmd "colorscheme tokyonight"))
    :lazy false}]                                                                                        	
