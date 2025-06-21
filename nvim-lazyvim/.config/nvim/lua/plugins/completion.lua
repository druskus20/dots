return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      -- Disable for some filetypes
      enabled = function()
        return not vim.tbl_contains({ "DressingInput" }, vim.bo.filetype)
            and vim.bo.buftype ~= "prompt"
            and vim.b.completion ~= false
      end,
      -- Disable scrollbars in favor of scrollbar.nvim
      completion = {
        menu = {
          scrollbar = false,
        },
        documentation = {
          auto_show = true,
          window = {
            scrollbar = false,
          },
        },
      },
      sources = {
        providers = {
          lsp = {
            transform_items = function(_, items)
              local types = require('blink.cmp.types')
              -- demote snippets
              for _, item in ipairs(items) do
                if item.kind == types.CompletionItemKind.Snippet then
                  item.score_offset = item.score_offset - 3
                end
              end

              -- give priority to constants (also rust's enum variants) over methods
              for _, item in ipairs(items) do
                if item.kind == types.CompletionItemKind.Constant then
                  item.score_offset = item.score_offset + 3
                end
              end

              -- filter out text items, since we have the buffer source
              return vim.tbl_filter(
                function(item) return item.kind ~= types.CompletionItemKind.Text end,
                items
              )
            end,
          },
        },
      },
      keymap = {
        preset = "enter",
        ["<C-y>"] = {}, -- disable lazyvim mapping
        ["<C-u>"] = { function(cmp) cmp.scroll_documentation_up(4) end },
        ["<C-d>"] = { function(cmp) cmp.scroll_documentation_down(4) end },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<C-CR>"] = { "fallback" },
      },
    }
  }
}
