return {
  {

    "LazyVim/LazyVim",
    branch = "main",
    --commit = "7c7c196a78e936a1bc4cf28e7908e9bd96d75607", -- 0.12
    --commit = "b2f750558a3737879f8151e741e7a3988886e37f", -- 0.13

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
      },
      indent = {
        enabled = false,
      },
      scroll = {
        enabled = false,
      },
      lazygit = {
        enabled = false,
      },
      terminal = {
        enabled = false,
      },
      profiler = {
        enabled = false,
      },
      -- Reemplaces dressing.nvim (for rename)
      input = {
        enabled = false,
        win = {
          relative = "cursor",
        }
      },
      picker = {
        enabled = false,
      },
    }
  },
  {
    "snacks.nvim",
    opts = {
      zen = {
        toggles = {
          dim = false,
          git_signs = false,
          mini_diff_signs = false,
        }
      },
      styles = {
        zen = {
          enter = true,
          fixbuf = false,
          minimal = false,
          width = 160,
          height = 0,
          backdrop = { transparent = false, blend = 20 },
          keys = { q = false },
          zindex = 40,
          wo = {
            winhighlight = "NormalFloat:Normal",
          },
          w = {
            snacks_main = true,
          },
        }
      },
    }
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 25,
      },
      default_component_configs = {
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖", -- this can only be used in the git_status source
            renamed = "󰁕", -- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
      },
    },
  }
}
