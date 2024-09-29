return {
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
        enabled = true,
      },
      messages = {
        enabled = true,
      },
      -- the completion menu for the cmdline
      popupmenu = {
        enabled = true,

        backend = "cmp" -- do not use the "vscode style" middle of the screen popup (nui?)
        -- Side effect: apparently fixed an issue with "Save changes to ..." popup being slow to respond(?)
      }
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = function(_, opts)
      local base_stages = require("notify.stages.static")("top_down")
      table.unpack = table.unpack or unpack -- Lua 5.1 compatibility
      opts.render = "compact"
      -- Remove the border, avoid notification resizing issue (it first creates a border, then removes it)
      opts.stages = {
        function(...)
          local custom_stages = base_stages[1](...)
          if custom_stages then
            custom_stages.border = "none"
          end
          return custom_stages
        end,
        table.unpack(base_stages, 2),
      }
      return opts
    end
  }
}
