return {
  'stevearc/oil.nvim',
  opts = {
    float = {
      -- Padding around the floating window
      padding = 2,
      -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      max_width = 0.4,
      max_height = 0.4,
    },
    keymaps = {
      -- esc to quit
      -- q to quit
      -- Q to quit
      ['<esc>'] = { "actions.close", mode = "n" },
      ['q'] = { "actions.close", mode = "n" },
      ['Q'] = { "actions.close", mode = "n" },

      -- Control+h is one directory back
      -- Control+l is one directory forward
      ['<C-h>'] = { "actions.parent", mode = "n" },
      ['<C-l>'] = { "actions.select", mode = "n" },

      -- Disable Control i and o
      ['<C-i>'] = false,
      ['<C-o>'] = false,
    },
    confirmation = {
      max_width = 0.7,
      min_width = { 5, 0.2 },
      -- optionally define an integer/float for the exact width of the preview window
      -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- min_height and max_height can be a single value or a list of mixed integer/float types.
      -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
      max_height = 0.9,
      -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
      min_height = { 5, 0.1 },
      -- optionally define an integer/float for the exact height of the preview window
      height = nil,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
  },
  keys = {
    {
      -- control E
      "<C-e>",
      function()
        require("oil").open_float()
      end,
      desc = "Open parent directory in float",
    },
    {
      "<leader>o",
      function()
        require("oil").open_float()
      end,
      desc = "Open parent directory in float",
    },
  },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
}
