(module config.plugins.twilight
  {autoload {utils config.utils
             colors config.colors
             twilight twilight}})

;(set vim.opt.termguicolors true)

; https://github.com/folke/twilight.nvim/issues/15
(twilight.setup
  {:expand [:function
            :method
            :table
            :if_statement]
   :exclude {}
   :context 3
   :treesitter false
   :dimming {:inactive false
             :alpha 0.35
             :color [:Normal "#ffffff"]}})

