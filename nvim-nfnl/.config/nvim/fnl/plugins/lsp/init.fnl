(local util (require :util))
(local lsp (require :util.lsp))
[{1 :neovim/nvim-lspconfig
    :config (fn [_ opts]
              ;(util.format.register (lsp.formatter))
              ;(when (not= opts.autoformat nil)
              ;  (set vim.g.autoformat opts.autoformat)
              ;  (util.deprecate :nvim-lspconfig.opts.autoformat :vim.g.autoformat)
              (lsp.on_attach (fn [client buffer 
                                    ((. (require :plugins.lsp.keymaps) :on_attach) client buffer)]))
              (local register-capability
                     (. vim.lsp.handlers :client/registerCapability))
              (tset vim.lsp.handlers :client/registerCapability
                    (fn [err res ctx]
                      (local ret (register-capability err res ctx))
                      (local client-id ctx.client_id)
                      (local client (vim.lsp.get_client_by_id client-id))
                      (local buffer (vim.api.nvim_get_current_buf))
                      ((. (require :plugins.lsp.keymaps) :on_attach) client buffer)
                      ret))
              ;(each [name icon (pairs (. (. (require :config) :icons)
              ;                           :diagnostics)
              ;  (set-forcibly! name (.. :DiagnosticSign name))
              ;  (vim.fn.sign_define name {:numhl "" :text icon :texthl name}))
              (when (and (= (type opts.diagnostics.virtual_text) :table)
                         (= opts.diagnostics.virtual_text.prefix :icons))
                (set opts.diagnostics.virtual_text.prefix  "●"))
                ; TODO Instead of the line above
                ;(set opts.diagnostics.virtual_text.prefix
                ;     (or (and (= (vim.fn.has :nvim-0.10.0) 0) "●")
                ;         (fn [diagnostic]
                ;           (local icons (. (. (require :config) :icons) :diagnostics))
                ;           (each [d icon (pairs icons)]
                ;             (when (= diagnostic.severity
                ;                      (. vim.diagnostic.severity (d:upper)))
                ;               (lua "return icon")))))))
              (vim.diagnostic.config (vim.deepcopy opts.diagnostics))
              (local servers opts.servers)
              (local (has-cmp cmp-nvim-lsp) (pcall require :cmp_nvim_lsp))
              (local capabilities
                     (vim.tbl_deep_extend :force {}
                                          (vim.lsp.protocol.make_client_capabilities)
                                          (or (and has-cmp
                                                   (cmp-nvim-lsp.default_capabilities))
                                              {})
                                          (or opts.capabilities {})))

              (fn setup [server]
                (local server-opts
                       (vim.tbl_deep_extend :force
                                            {:capabilities (vim.deepcopy capabilities)}
                                            (or (. servers server) {})))
                (if (. opts.setup server)
                    (when ((. opts.setup server) server server-opts)
                      (lua "return ")) (. opts.setup "*")
                    (when ((. opts.setup "*") server server-opts) (lua "return ")))
                ((. (. (require :lspconfig) server) :setup) server-opts))

              (local (have-mason mlsp) (pcall require :mason-lspconfig))
              (var all-mslp-servers {})
              (when have-mason
                (set all-mslp-servers
                     (vim.tbl_keys (. (require :mason-lspconfig.mappings.server)
                                      :lspconfig_to_package))))
              (local ensure-installed {})
              (each [server server-opts (pairs servers)]
                (when server-opts
                  (set-forcibly! server-opts
                                 (or (and (= server-opts true) {}) server-opts))
                  (if (or (= server-opts.mason false)
                          (not (vim.tbl_contains all-mslp-servers server)))
                      (setup server)
                      (tset ensure-installed (+ (length ensure-installed) 1)
                            server))))
              (when have-mason
                (mlsp.setup {:ensure_installed ensure-installed
                             :handlers [setup]}))
              (when (and (lsp.get_config :denols)
                         (lsp.get_config :tsserver))
                (local is-deno
                       ((. (require :lspconfig.util) :root_pattern) :deno.json
                                                                    :deno.jsonc))
                (lsp.disable :tsserver is-deno)
                (lsp.disable :denols (fn [root-dir] (not (is-deno root-dir))))))
  :dependencies [:mason.nvim 
                 :williamboman/mason-lspconfig.nvim]
  :event :LazyFile
  :opts {:capabilities {}
         :diagnostics {:severity_sort true
                       ;:signs {:text {vim.diagnostic.severity.ERROR (. (. (. (require :config) :icons) :diagnostics) :Error)
                       ;               vim.diagnostic.severity.HINT (. (. (. (require :config) :icons) :diagnostics) :Hint)
                       ;               vim.diagnostic.severity.INFO (. (. (. (require :config) :icons) :diagnostics) :Info)
                       ;               vim.diagnostic.severity.WARN (. (. (. (require :config) :icons) :diagnostics) :Warn)
                       :underline true
                       :update_in_insert false
                       :virtual_text {:prefix "●"
                                      :source :if_many
                                      :spacing 4}}
         :format {:formatting_options nil :timeout_ms nil}
         :inlay_hints {:enabled false}
         :servers {:lua_ls {:settings {:Lua {:completion {:callSnippet :Replace}}}}}
                :workspace {:checkThirdParty false}
         :setup {}}}


 {1 :williamboman/mason.nvim
  :build ":MasonUpdate"
  :cmd :Mason
  :config (fn [_ opts]
            ((. (require :mason) :setup) opts)
            (local mr (require :mason-registry))
            (mr:on "package:install:success"
                   (fn [] (vim.defer_fn (fn [] ((. (require :lazy.core.handler.event) :trigger) 
                                                {:buf (vim.api.nvim_get_current_buf :event :FileType)}))
                            100)))

            (fn ensure-installed []
              (each [_ tool (ipairs opts.ensure_installed)]
                (local p (mr.get_package tool))
                (when (not (p:is_installed)) (p:install))))

            (if mr.refresh (mr.refresh ensure-installed) (ensure-installed)))
  :keys [{1 :<leader>cm 2 :<cmd>Mason<cr> :desc :Mason}]
  :opts {:ensure_installed [:stylua :shfmt]}}] 

