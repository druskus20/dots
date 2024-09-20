return {
  -- add gruvbox
  {
    "catppuccin/nvim",
    opts = {
      custom_highlights = function(colors)
        return {
          NormalBorder = { bg = colors.mantle, fg = colors.mantle },
          FloatBorder = { bg = colors.mantle, fg = colors.mantle },
          FloatTitle = { bg = colors.red, fg = colors.crust },
          MsgArea = { bg = colors.mantle, fg = colors.text },
        }
      end
    }
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
