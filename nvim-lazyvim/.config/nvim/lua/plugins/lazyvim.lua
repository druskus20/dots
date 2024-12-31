return {
  {

    "LazyVim/LazyVim",
    branch = "main",
    --commit = "7c7c196a78e936a1bc4cf28e7908e9bd96d75607",
    commit = "b2f750558a3737879f8151e741e7a3988886e37f", -- 0.13

    opts = {
      defaults = {
        autocmds = true, -- lazyvim.config.autocmds
        keymaps = true,  -- lazyvim.config.keymaps
      },
    }
  },
  {
    "snacks.nvim",
    opts = {
      notifier = {
        enabled = false, -- TODO: switch out nvim-notify
      },
      dashboard = {
        enabled = false,
      }
    }
  }
}
