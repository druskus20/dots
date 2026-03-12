return {
  {
    "sindrets/diffview.nvim",
    opts = {
      enhanced_diff_hl = true, -- See |diffview-config-enhanced_diff_hl|
      view = {
        -- Configure the layout and behavior of different types of views.
        -- Available layouts:
        --  'diff1_plain'
        --    |'diff2_horizontal'
        --    |'diff2_vertical'
        --    |'diff3_horizontal'
        --    |'diff3_vertical'
        --    |'diff3_mixed'
        --    |'diff4_mixed'
        -- For more info, see |diffview-config-view.x.layout|.
        default = {
        },
        merge_tool = {
          -- Config for changed files, and staged files in diff views.
          layout = "diff3_horizontal",
          disable_diagnostics = true, -- Temporarily disable diagnostics for diff buffers while in the view.
        }
      }
    },
  }
}
