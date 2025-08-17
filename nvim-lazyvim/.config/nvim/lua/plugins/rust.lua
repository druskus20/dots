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
    opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>cR", function()
            vim.cmd.RustLsp("codeAction")
          end, { desc = "Code Action", buffer = bufnr })
          vim.keymap.set("n", "<leader>dr", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Rust Debuggables", buffer = bufnr })
          vim.lsp.inlay_hint.enable(false) -- TODO: not working
        end,
      }
    },
    config = function(_, opts)
      -- Set up CSS injection for style! macro
      vim.treesitter.query.set("rust", "injections", [[
        ; Match style! macro with raw string literal
        (macro_invocation
          macro: (identifier) @macro_name (#eq? @macro_name "style")
          (token_tree
            (raw_string_literal
              (string_content) @injection.content
            )
          )
          (#set! injection.language "css")
          (#set! injection.include-children)
        )

        ; Alternative pattern for regular string literals in style! macro
        (macro_invocation
          macro: (identifier) @macro_name (#eq? @macro_name "style")
          (token_tree
            (string_literal
              (string_content) @injection.content
            )
          )
          (#set! injection.language "css")
          (#set! injection.include-children)
        )
      ]])

      -- Apply rustaceanvim configuration
      vim.g.rustaceanvim = opts
    end
  }
}
