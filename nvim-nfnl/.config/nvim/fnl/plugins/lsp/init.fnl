(local util (require :util))
(local lsp (require :util.lsp))

; TODO: FIX
;(vim.cmd "autocmd FileType DressingInput imap <buffer> <C-j> <Down>")
;(vim.cmd "autocmd FileType DressingInput imap <buffer> <C-k> <Up>")
;(vim.cmd "autocmd FileType DressingSelect imap <buffer> <C-j> <Down>")
;(vim.cmd "autocmd FileType DressingSelect imap <buffer> <C-k> <Up>")
; TODO: Custom handlers for things. With titles and borders
; vim.lsp.buf.references
; vim.lsp.buf.handlers
; https://github.com/pbogut/dotfiles/blob/7ba96f5871868c1ce02f4b3832c1659637fb0c2c/config/nvim/lua/plugins/nvim_lsp.lua#L84

;symbols to show for lsp diagnostics
(fn define-signs
  [prefix]
  (let [error (.. prefix "SignError")
        warn  (.. prefix "SignWarn")
        info  (.. prefix "SignInfo")
        hint  (.. prefix "SignHint")]
    (vim.fn.sign_define error {:text "" :texthl error})
    (vim.fn.sign_define warn  {:text "" :texthl warn})
    (vim.fn.sign_define info  {:text "" :texthl info})
    (vim.fn.sign_define hint  {:text "" :texthl hint})))

(define-signs "Diagnostic")

[{1 :neovim/nvim-lspconfig
    :config (fn [_ opts]
              ;(util.format.register (lsp.formatter))
              ;(when (not= opts.autoformat nil)
              ;  (set vim.g.autoformat opts.autoformat)
              ;  (util.deprecate :nvim-lspconfig.opts.autoformat :vim.g.autoformat)
              ;
              (vim.api.nvim_set_hl 0 "LspInlayHint" {:fg :#3f424f})
              (vim.api.nvim_set_hl 0 "LspCodeLens" {:fg :#3f424f})
              (lsp.on_attach (fn [client buffer]
                              ((. (require :plugins.lsp.keymaps) :on_attach) client buffer)))
                
              ; Set LSP diagnostic order 
              (tset vim.lsp.handlers :textDocument/publishDiagnostics
                    (vim.lsp.with vim.lsp.diagnostic.on_publish_diagnostics {:severity_sort true}))

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
  ; :event :LazyFile ; Custom event by lazyvim
  ;:event :VeryLazy 
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
         :inlay_hints {:enabled true} ; does not work?

         :servers {
                    :terraformls {}
                    :terraform_lsp {}
                    :tsserver {}
                    :html {}
                    :zls {}
                    :ruff_lsp {}
                    :wgsl_analyzer {}
                    :yamlls {}
                    :helm_ls {}}
                :workspace {:checkThirdParty false}
         :setup {}}}
; // TODO: does not work
; {1 :Bekaboo/dropbar.nvim
;    :dependencies ["nvim-telescope/telescope-fzf-native.nvim"]}

 {1 :williamboman/mason.nvim
  :build ":MasonUpdate"
  :cmd :Mason
  :config (fn [_ opts]
            ((. (require :mason) :setup) opts)
            (local mr (require :mason-registry))
            (mr:on "package:install:success"
                   (fn [] (vim.defer_fn (fn [] ((. (require :lazy.core.handler.event) :trigger) 
                                                {:buf (vim.api.nvim_get_current_buf) :event :FileType}))
                            100))))

  :keys [{1 :<leader>cm 2 :<cmd>Mason<cr> :desc :Mason}]
  :opts {:ensure_installed [:stylua :shfmt]}}] 

