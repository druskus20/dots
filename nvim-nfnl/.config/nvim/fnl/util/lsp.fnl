(local M {})

(fn M.on_attach [on-attach]
  (vim.api.nvim_create_autocmd :LspAttach
                               {:callback (fn [args] (local buffer args.buf)
                                            (local client
                                                   (vim.lsp.get_client_by_id args.data.client_id))
                                            (on-attach client buffer))}))

M
