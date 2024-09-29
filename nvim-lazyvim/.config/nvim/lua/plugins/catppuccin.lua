return {
  {
    "catppuccin/nvim",
    opts_extend = { "custom_highlights" },
    opts = {
      no_italic = true,
      no_bold = true,
      custom_highlights = function(colors)
        local U = require("catppuccin.utils.colors")

        return {
          -- Spelling
          Spell = { fg = colors.red },
          SpellBad = { fg = colors.red },
          SpellCap = { fg = colors.red },
          SpellLocal = { fg = colors.red },

          NormalBorder = { bg = colors.mantle, fg = colors.mantle },
          FloatBorder = { bg = colors.mantle, fg = colors.mantle },
          FloatTitle = { bg = colors.red, fg = colors.crust },
          MsgArea = { bg = colors.mantle, fg = colors.text },

          -- Custom diagnostic highlights using the 'U.darken' function
          DiagnosticVirtualTextError = {
            bg = U.darken(colors.red, 0.07, colors.base),
            fg = U.darken(colors.red, 0.65, colors.base)
          },
          DiagnosticVirtualTextWarn = {
            bg = U.darken(colors.yellow, 0.04, colors.base),
            fg = U.darken(colors.yellow, 0.25, colors.base)
          },
          DiagnosticVirtualTextInfo = {
            bg = U.darken(colors.sky, 0.04, colors.base),
            fg = U.darken(colors.sky, 0.25, colors.base)
          },
          DiagnosticVirtualTextHint = {
            bg = U.darken(colors.teal, 0.02, colors.base),
            fg = U.darken(colors.teal, 0.5, colors.base)
          },

          -- TODO: Move to telescope.lua
          -- currently, that breaks this highlighting
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

          -- TODO: move to notify
          -- Does not work
          -- NotifyBackground = { bg = colors.red, fg = colors.text },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
