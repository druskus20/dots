(module config.plugins.colorizer
  {autoload {colorizer colorizer}})

; This is annoying
(set vim.o.termguicolors true)

(colorizer.setup
  ["*"]
  {:RGB true
   :RRGGBB true
   :names false
   :RRGGBBAA true
   :rgb_fn true
   :hsl_fn true
   :mode "background"})
