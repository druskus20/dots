return {
  {
    --'petertriho/nvim-scrollbar',
    'druskus20/nvim-scrollbar',
    branch = "dropbar",
    opts = {
      set_highlights = false,
      hide_if_all_visible = false,
      throttle_ms = 50, -- default: 100
      marks = {
        Error = {
          text = { "-" },
        },
        Warn = {
          text = { "-" },
        },
        Info = {
          text = { "-" },
        },
        Hint = {
          text = { "-" },
        },
        Cursor = {
          text = " ",
        }
      }
    }
  }
}
