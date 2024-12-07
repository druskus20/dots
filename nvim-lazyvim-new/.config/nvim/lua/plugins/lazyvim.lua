return {
  {

    "LazyVim/LazyVim",
    -- branch = "main",
    -- commit = "7c7c196a78e936a1bc4cf28e7908e9bd96d75607",
    opts = {
      defaults = {
        autocmds = true, -- lazyvim.config.autocmds
        keymaps = true,  -- lazyvim.config.keymaps
      },
    }
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = false,
      },
      lazygit = {
        enabled = false,
      },
      -- TODO: use this notifier
      notifier = {
        enabled = false,
      }

    }
  }
}
