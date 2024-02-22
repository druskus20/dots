(local M {})
(fn M.get_clients [opts]
  (var ret {})
  (if vim.lsp.get_clients (set ret (vim.lsp.get_clients opts))
      (do
        (set ret (vim.lsp.get_active_clients opts))
        (when (and opts opts.method)
          (set ret (vim.tbl_filter (fn [client]
                                     (client.supports_method opts.method
                                                             {:bufnr opts.bufnr}))
                                   ret)))))
  (or (and (and opts opts.filter) (vim.tbl_filter opts.filter ret)) ret))
(fn M.on_attach [on-attach]
  (vim.api.nvim_create_autocmd :LspAttach
                               {:callback (fn [args] (local buffer args.buf)
                                            (local client
                                                   (vim.lsp.get_client_by_id args.data.client_id))
                                            (on-attach client buffer))}))
(fn M.on_rename [from to]
  (let [clients (M.get_clients)]
    (each [_ client (ipairs clients)]
      (when (client.supports_method :workspace/willRenameFiles)
        (local resp (client.request_sync :workspace/willRenameFiles
                                         {:files [{:newUri (vim.uri_from_fname to)
                                                   :oldUri (vim.uri_from_fname from)}]}
                                         1000 0))
        (when (and resp (not= resp.result nil))
          (vim.lsp.util.apply_workspace_edit resp.result client.offset_encoding))))))
(fn M.get_config [server]
  (let [configs (require :lspconfig.configs)] (rawget configs server)))
(fn M.disable [server cond]
  (let [util (require :lspconfig.util)
        def (M.get_config server)]
    (set def.document_config.on_new_config
         (util.add_hook_before def.document_config.on_new_config
                               (fn [config root-dir]
                                 (when (cond root-dir config)
                                   (set config.enabled false)))))))
M
