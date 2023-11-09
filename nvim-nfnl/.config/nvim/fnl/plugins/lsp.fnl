[{1 :neovim/nvim-lspconfig 
  :config (fn [_ opts]
            (print "AAA")
            (print "AAA")
            (let [lsp (require :lspconfig)]
              ;; To add support to more language servers check:
              ;; https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
              (lsp.terraform-ls.setup {})))}]
