return {
  {
    "iamcco/markdown-preview.nvim",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {},
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      html = {
        comment = {
          conceal = false, -- This hides HTML comments
          text = nil,
          highlight = 'RenderMarkdownHtmlComment',
        },
      },

      bullet = {
        enabled = true,
        icons = {
          "•",
          "◦",
          "▪",
          "▫",

        },
      },
      checkbox = {
        enabled = true,
        checked = {
          --icon = "▪",
          icon = "",
          -- 
        },
        unchecked = {
          -- icon = "▫",
          icon = "",
          -- 
        }
      },
    },
  }
}
