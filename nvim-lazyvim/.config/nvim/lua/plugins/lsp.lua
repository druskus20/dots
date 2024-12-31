-- {
--   "stevearc/dressing.nvim"
--   :enabled true
--   :opts {:select { :backend [ "builtin"]
--                     :builtin { :width nil
--                                :max_width [ 140 0.8]
--                                :min_width [ 20 0]
--                                :height nil
--                                :max_height 0.9
--                                :min_height [ 0 0]
--
--                                :title_pos :left
--                                :border :single
--                                :relative :cursor}}}} ; TODO: PR to make the window cursor right bellow the cursor
--
return {
  {
    "smjonas/inc-rename.nvim",
    opts = {
      --input_buffer_type = "dressing"
    }
  },
  {
    "stevearc/dressing.nvim",
    opts = {
      select = {
        backend = { "builtin" },
        builtin = {
          width = nil,
          max_width = { 140, 0.8 },
          min_width = { 20, 0 },
          height = nil,
          max_height = 0.9,
          min_height = { 0, 0 },
          title_pos = "left",
          border = "single",

          relative = "cursor",
        },
      }
    }
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "LspAttach",
    -- https://github.com/Bekaboo/dropbar.nvim/issues/160
    opts = function()
      local utils = require('dropbar.utils')
      local bar_utils = require('dropbar.utils.bar')
      local api = require('dropbar.api')

      local open_item_and_close_menu = function()
        local menu = utils.menu.get_current()
        local cursor = vim.api.nvim_win_get_cursor(menu.win)
        local entry = menu.entries[cursor[1]]
        -- stolen from https://github.com/Bekaboo/dropbar.nvim/issues/66
        local component = entry:first_clickable(entry.padding.left + entry.components[1]:bytewidth())
        if component then
          menu:click_on(component, nil, 1, 'l')
        end
      end

      return {
        menu = {
          keymaps = {
            ['<C-h>'] = function()
              -- Move to previous breadcrumb
              print("TODO Move to previous breadcrumb")
            end,
            ['<C-l>'] = function()
              -- Move to next breadcrumb
              print("TODO Move to next breadcrumb")
            end,
            ['h'] = function()
              -- Contract breadcrumbs
              local menu = utils.menu.get_current()
              if menu.prev_menu then
                menu:close()
              else
                local bar = bar_utils.get({ win = menu.prev_win })
                if not bar then
                  return
                end
                local barComponents = bar.components[1]._.bar.components
                for _, component in ipairs(barComponents) do
                  if component.menu then
                    local idx = component._.bar_idx
                    menu:close()
                    api.pick(idx - 1)
                  end
                end
              end
            end,
            ['l'] = function()
              -- Expand breadcrumbs
              local menu = utils.menu.get_current()
              local cursor = vim.api.nvim_win_get_cursor(menu.win)
              local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
              if component then
                menu:click_on(component, nil, 1, 'l')
              end
            end,
            ['<CR>'] = open_item_and_close_menu,
            ['o'] = open_item_and_close_menu,
          }
        },
      }
    end
  },
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {
      icons = {
        type = "» ",
        parameter = "« ",
        offspec = " ", -- hint kind not defined in official LSP spec
        unknown = " ", -- hint kind is nil
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local keymaps = require("lazyvim.plugins.lsp.keymaps").get()

      -- Disable all the default LazyVim keymaps
      for _, keymap in ipairs(keymaps) do
        keymap[2] = false
      end

      local custom_keymaps = {
        { "<c-s>",      vim.lsp.buf.signature_help,  mode = { "n", "i" },            desc = "Signature Help", has = "signatureHelp" },
        { "K",          vim.lsp.buf.signature_help,  mode = "n",                     desc = "Signature Help", has = "signatureHelp" },
        { "<leader>mh", vim.lsp.buf.hover,           desc = "Hover" },
        { "H",          vim.lsp.buf.hover,           desc = "Hover" },
        { "<leader>ms", vim.lsp.buf.signature_help,  desc = "Signature Help",        has = "signatureHelp" },
        { "<leader>md", vim.lsp.buf.definition,      desc = "Goto Definition",       has = "definition" },
        { "<leader>mi", vim.lsp.buf.implementation,  desc = "Goto Implementation" },
        { "<leader>my", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
        { "<leader>mD", vim.lsp.buf.declaration,     desc = "Goto Declaration" },
        { "gd",         vim.lsp.buf.definition,      desc = "Goto Definition",       has = "definition" },
        { "gi",         vim.lsp.buf.implementation,  desc = "Goto Implementation" }, -- overwrites "go to last insert"
        { "gy",         vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
        { "gD",         vim.lsp.buf.declaration,     desc = "Goto Declaration" },
        { "<leader>md", vim.diagnostic.open_float,   desc = "Line Diagnostics" },
        { "<leader>ma", vim.lsp.buf.code_action,     desc = "Code Action",           has = "codeAction",      mode = { "n", "v" } },
        { "<leader>mA", LazyVim.lsp.action.source,   desc = "Source Action",         has = "codeAction" },
        { "<leader>ml", vim.lsp.codelens.run,        desc = "Run Codelens",          mode = { "n", "v" },     has = "codeLens" },
        { "<leader>mr", vim.lsp.buf.rename,          desc = "Rename",                has = "rename" },
        -- BUG: Does not work
        --{
        --  "<leader>mr",
        --  function()
        --    local inc_rename = require("inc_rename")
        --    return ":IncRename"
        --  end,
        --  desc = "Rename (inc)",
        --  has = "rename"
        --},
        { "<leader>mf", Snacks.rename.rename_file,   desc = "Rename File",           mode = { "n" },          has = { "workspace/didRenameFiles", "workspace/willRenameFiles" } },
        { "<leader>mR", vim.lsp.buf.references,      desc = "References",            nowait = true },
        {
          "]]",
          function() Snacks.words.jump(vim.v.count1) end,
          has = "documentHighlight",
          desc = "Next Reference",
          cond = function() return Snacks.words.enabled end
        },
        {
          "[[",
          function() Snacks.words.jump(-vim.v.count1) end,
          has = "documentHighlight",
          desc = "Prev Reference",
          cond = function() return Snacks.words.enabled end
        },
      }

      vim.list_extend(keymaps, custom_keymaps)
      opts.keymaps = keymaps
    end,
  },
}

-- try: https://github.com/Saghen/blink.cmp?tab=readme-ov-file#compared-to-nvim-cmp
