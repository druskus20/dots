
(local M {})
(fn M.on_attach [_ buffer]
  ; I think I should be using "LazyKeys"  (loading "after" everything else, on LSP attach)
  (vim.keymap.set [ "n" "v" ] "<leader>mv" vim.lsp.buf.code_action {:desc "Code Action"})
  (vim.keymap.set "n" "<leader>ma" vim.diagnostic.open_float {:desc "Line Diagnostics"})
  (vim.keymap.set "n" "<leader>mg" vim.lsp.buf.definition {:desc "Goto Definition"})
  (vim.keymap.set "n" "<leader>mr" vim.lsp.buf.rename {:desc "Rename"})
  (vim.keymap.set "n" "<leader>mh" vim.lsp.buf.hover {:desc "Hover"})
  (vim.keymap.set "n" "<leader>ms" vim.lsp.buf.references {:desc "Search References"}))
M
