return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<C-m>", LazyVim.pick("lsp_workspace_symbols"), desc = "Lsp Symbols (Root Dir)" },
      { "<C-g>", LazyVim.pick("live_grep"),             desc = "Grep (Root Dir)" },
      { "<C-f>", LazyVim.pick("files"),                 desc = "Find Files" },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("scoped_crate")
    end,
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
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    keys = {
      { "<C-F>", "<CMD>Telescope scoped_crate<CR>", desc = "Find Files (Scoped crate)" }
    },
    opts = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("scoped_crate")
      end)
    end,
  }
}
