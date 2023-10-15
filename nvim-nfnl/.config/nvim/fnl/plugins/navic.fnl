
(local lsp (require :util.lsp)) 

[{1 :SmiteshP/nvim-navic
  :init (fn []
          (set vim.g.navic_silence true)
          ((. (require :util.lsp) :on_attach) (fn [client buffer]
                                                (when (client.supports_method :textDocument/documentSymbol)
                                                  ((. (require :nvim-navic) :attach) client buffer)))))
  :lazy true
  :opts (fn []
          {:depth_limit 5
           :highlight true
           ;:icons (. (require :lazyvim.config) :icons :kinds) TODO:
           :lazy_update_context true
           :separator " "})}

 {1 :nvim-lualine/lualine.nvim
  :optional true
  :opts (fn [_ opts]
          (table.insert opts.sections.lualine_c
                        {1 (fn []
                             ((. (require :nvim-navic) :get_location)))
                         :cond (fn []
                                 (and (. package.loaded :nvim-navic)
                                      ((. (require :nvim-navic) :is_available))))}))}]
        
