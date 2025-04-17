return {
  'neovim/nvim-lspconfig',
  opts = {
    setup = {
      -- Fix a problem with rust_analyzer being installed with lazyvim
      -- see `:h rustaceanvim.mason`
      --rust_analyzer = function()
      --  return true
      --end,
    },
  },
  {
    'mrcjkb/rustaceanvim',
    commit = '0f7e844', -- lock to nvim 0.10
    opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>cR", function()
            vim.cmd.RustLsp("codeAction")
          end, { desc = "Code Action", buffer = bufnr })
          vim.keymap.set("n", "<leader>dr", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Rust Debuggables", buffer = bufnr })
          vim.lsp.inlay_hint.enable(false)  -- TODO: not working
        end,
      }
    }
  }
}
