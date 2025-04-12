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
      ['<C-H>'] = { "actions.parent", mode = "n" },
      ['<C-L>'] = { "actions.select", mode = "n" },

      -- Disable Control i and o
      ['<C-i>'] = false,
      ['<C-o>'] = false,
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
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
}
