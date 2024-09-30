return {
  {
    "Bekaboo/dropbar.nvim",
    event = "LspAttach",
    opts = {}
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
        { "<leader>mR", LazyVim.lsp.rename_file,     desc = "Rename File",           mode = { "n" },          has = { "workspace/didRenameFiles", "workspace/willRenameFiles" } },
        { "mR",         vim.lsp.buf.references,      desc = "References",            nowait = true },
        {
          "]]",
          function() LazyVim.lsp.words.jump(vim.v.count1) end,
          has = "documentHighlight",
          desc = "Next Reference",
          cond = function() return LazyVim.lsp.words.enabled end
        },
        {
          "[[",
          function() LazyVim.lsp.words.jump(-vim.v.count1) end,
          has = "documentHighlight",
          desc = "Prev Reference",
          cond = function() return LazyVim.lsp.words.enabled end
        },
      }

      vim.list_extend(keymaps, custom_keymaps)
      opts.keymaps = keymaps
    end,
  },
}
