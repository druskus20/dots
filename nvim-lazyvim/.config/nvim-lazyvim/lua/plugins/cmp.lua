return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local auto_select = true
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.abort(),
        ["<Tab>"] = LazyVim.cmp.confirm({ select = auto_select }),
        -- Shift tab abort and insert a tab
        ["<S-Tab>"] = cmp.mapping(function(_)
          if cmp.visible() then
            cmp.abort()
          end
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", true)
        end),
        ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),

        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

        -- disable lazyvim defined keymaps
        ["<C-n>"] = nil,
        ["<C-p>"] = nil,
        ["<CR>"] = nil,
        ["<C-CR>"] = nil,
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
}
