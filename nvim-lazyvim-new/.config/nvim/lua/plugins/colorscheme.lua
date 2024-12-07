return {
  {
    "echasnovski/mini.icons",
    opts = {
      filetype = {
        -- replace some icons that render too big
        sh = { glyph = "" },
        yaml = { glyph = "" },
      }
    },
  },
  {
    "zenbones-theme/zenbones.nvim",
    -- I dont want lush
    --dependencies = "rktjmp/lush.nvim",
    priority = 1000,
    lazy = true,
    config = function()
      vim.g.zenbones_compat = 1 -- needed if lush is disabled
    end
  },
  {
    "catppuccin/nvim",
    opts_extend = { "custom_highlights" },
    priority = 1000,
    opts = {
      no_italic = true,
      no_bold = true,
      custom_highlights = function(colors)
        local U = require("catppuccin.utils.colors")
        local scrollbarHandle = U.darken(colors.text, 0.10, colors.base)

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
          NoiceCmdline = { bg = U.darken(colors.mantle, 0.45, colors.base) },


          -- TODO: Move to LSP
          LspInlayHint = { fg = U.darken(colors.text, 0.20, colors.mantle), bg = "" },

          -- TODO: Move to noice / notify
          -- Bug: does not work
          NotifyBackground = { bg = colors.red },

          -- Scrollbar highlights

          ScrollbarHandle = { bg = scrollbarHandle },
          ScrollbarCursorHandle = { bg = U.darken(colors.text, 0.25, colors.base) },
          -- link to CursorLine
          ScrollbarCursor = { bg = "#2a2b3c" },

          ScrollbarSearchHandle = { fg = colors.yellow, bg = scrollbarHandle },
          ScrollbarSearch = { fg = colors.yellow },

          ScrollbarErrorHandle = { fg = colors.red, bg = scrollbarHandle },
          ScrollbarError = { fg = colors.red },

          ScrollbarWarnHandle = { fg = colors.yellow, bg = scrollbarHandle },
          ScrollbarWarn = { fg = colors.yellow },

          ScrollbarInfoHandle = { fg = colors.sky, bg = scrollbarHandle },
          ScrollbarInfo = { fg = colors.sky },

          ScrollbarHintHandle = { fg = colors.teal, bg = scrollbarHandle },
          ScrollbarHint = { fg = colors.teal },

          ScrollbarMiscHandle = { fg = colors.pink, bg = scrollbarHandle },
          ScrollbarMisc = { fg = colors.pink },

          ScrollbarGitAddHandle = { fg = colors.green, bg = scrollbarHandle },
          ScrollbarGitAdd = { fg = colors.green },

          ScrollbarGitChangeHandle = { fg = colors.yellow, bg = scrollbarHandle },
          ScrollbarGitChange = { fg = colors.yellow },

          ScrollbarGitDeleteHandle = { fg = colors.red, bg = scrollbarHandle },
          ScrollbarGitDelete = { fg = colors.red },

        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      --colorscheme = "zenbones",
    },
  },
}
