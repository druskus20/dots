return {
  {
    "catppuccin/nvim",
    opts = {
      no_italic = true,
      no_bold = true,
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<C-P>", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      { "<C-F>", LazyVim.pick("files"),     desc = "Find Files (Root Dir)" },
    },
    opts = function(_, opts)
      local actions = require("telescope.actions")
      opts.defaults.mappings = {
        i = {
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.close,
          ["<esc>"] = actions.close,
        },
        n = {
          ["q"] = actions.close,
          ["o"] = actions.close,
        },
      }
    end,
  },
}
