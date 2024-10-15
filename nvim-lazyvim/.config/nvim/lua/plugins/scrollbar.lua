return {
  {
    'petertriho/nvim-scrollbar',
    opts = {
      set_highlights = false,
      hide_if_all_visible = false,
      throttle_ms = 50, -- default: 100
      marks = {
        Cursor = {
          text = " ",
        }
      }
    }
  }
}
