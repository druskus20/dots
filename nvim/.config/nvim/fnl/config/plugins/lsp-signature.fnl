(module config.plugins.lsp-signature
  {autoload {utils config.utils
             colors config.colors}
   require {lsp-signature lsp_signature}})

(lsp-signature.setup {:hint_enable false
                      :doc_lines 0
                      :use_lspsaga false
                      :handler_opts {:border :single}})
