return {
  {
    "catppuccin/nvim",
    opts = {
      no_italic = true,
      no_bold = true,
      _no_custom_highlights = function(colors)
        return {
          TelescopePromptPrefix = { bg = colors.mantle, fg = colors.red, },
          TelescopePromptTitle = { bg = colors.red, fg = colors.crust, },
          TelescopeSelection = { bg = colors.base, fg = colors.text, },
          TelescopeResultsDiffAdd = { fg = colors.green, },
          TelescopeResultsDiffChange = { fg = colors.yellow, },
          TelescopeResultsDiffDelete = { fg = colors.red, },
          TelescopeNormal = { bg = colors.mantle, },
          TelescopeBorder = { bg = colors.mantle, fg = colors.mantle, },
          TelescopePromptBorder = { bg = colors.mantle, fg = colors.mantle, },
          TelescopePromptNormal = { bg = colors.mantle, fg = colors.text, },
          TelescopeResultsTitle = { bg = colors.red, fg = colors.crust, },
        }
      end,
    },
  },
}
