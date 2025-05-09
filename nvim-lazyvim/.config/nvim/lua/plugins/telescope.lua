return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<C-m>", LazyVim.pick("lsp_workspace_symbols"), desc = "Lsp Symbols (Root Dir)" },
      { "<C-g>", LazyVim.pick("live_grep"),             desc = "Grep (Root Dir)" },
      { "<C-f>", LazyVim.pick("files"),                 desc = "Find Files" },
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
  {
    "druskus20/telescope-scoped-crate.nvim",
    keys = {
      {
        "<C-c>",
        function()
          require("telescope").extensions.scoped_crate.scoped_crate()
        end,
        desc = "Find Files (Scoped crate)"
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("scoped_crate")
      end)
    end,
  }
}
