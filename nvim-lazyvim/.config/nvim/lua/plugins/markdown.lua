return {
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

      checkbox = {
        enabled = true,
        checked = {
          icon = ""
          -- 
        },
        unchecked = {
          icon = ""
          -- 
        }
      },
    },
  }
}
