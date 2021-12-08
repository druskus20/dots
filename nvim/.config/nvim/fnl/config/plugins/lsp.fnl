(module config.plugins.lsp
  {autoload {a aniseed.core
             lsp lspconfig 
             lsp-configs lspconfig/configs
             utils config.utils
             cmp_nvim_lsp cmp_nvim_lsp}

   require-macros [config.macros]})

; Check https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md for default config for all of them

; Helper Functions >>>
(fn on_attach [client bufnr]
  (pkg lsp_signature.nvim [lsp_signature (require "lsp_signature")]
       (lsp_signature.on_attach {:bind true
                                 :hint_scheme "String" 
                                 :hint_prefix "ƒ "
                                 :handler_opts {:border "single"}
                                 :use_lspsaga false
                                 :decorator ["`" "`"]}))

  (if client.resolved_capabilities.document_highlight
    (do
      (utils.highlight "LspReferenceRead"  {:gui "underline"})
      (utils.highlight "LspReferenceText"  {:gui "underline"})
      (utils.highlight "LspReferenceWrite" {:gui "underline"})
      (vim.api.nvim_exec
        "augroup lsp_document_highlight
        autocmd! * <buffer> 
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END"
        false))))
        ;autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight())))) 

(fn better_root_pattern [patterns except-patterns]
  "match path if one of the given patterns is matched, EXCEPT if one of the except-patterns is matched"
  (fn [path] 
    (when (not ((lsp.util.root_pattern except-patterns) path))
      ((lsp.util.root_pattern patterns) path))))

(def default-capabilities
  (let [capabilities (vim.lsp.protocol.make_client_capabilities)]
    (set capabilities.textDocument.completion.completionItem.snippetSupport true)
    (cmp_nvim_lsp.update_capabilities capabilities))) ; cmp stuff
;    capabilities))                                   ; non cmp stuff

(fn init-lsp [lsp-name ?opts]
  "initialize a language server with defaults"
  (let [merged-opts (a.merge {:on_attach on_attach :capabilities default-capabilities} (or ?opts {}))]
    ((. lsp lsp-name :setup) merged-opts)))

; <<<

; Lsp Stuff >>>
(tset vim.lsp.handlers :textDocument/publishDiagnostics
  (vim.lsp.with vim.lsp.diagnostic.on_publish_diagnostics 
                {:update_in_insert false
                 :virtual_text {:prefix "◆"}
                 :signs false}))

;(init-lsp :jsonls {:commands {:Format [ #(vim.lsp.buf.range_formatting [] [0 0] [(vim.fn.line "$") 0])]}})
;(init-lsp :denols {:root_dir (better_root_pattern [".git"] ["package.json"])})
;(init-lsp :hls {:settings {:languageServerHaskell {:formattingProvider "stylish-haskell"}}})
;(init-lsp :ocamllsp)
;(init-lsp :vimls)
;(init-lsp :gopls)
;(init-lsp :bashls)
;(init-lsp :erlangls)
;(init-lsp :yamlls)
;(init-lsp :html)
;(init-lsp :svelte)
;(init-lsp :elmls)
;(init-lsp :clangd)
;(init-lsp :ccls)
;(init-lsp :ccls)

(init-lsp :texlab
          {:settings {:texlab {:chktex {:onOpenAndSave true :onEdit true}
                               :build {:isContinuous true
                                       :args ["-pdf"
                                              "-pvc"
                                              "-synctex=1"
                                              "-interaction=nonstopmode" 
                                              "%f"]}}}})


(init-lsp :cssls {:filestypes ["css" "scss" "less" "stylus"]
                  :root_dir (lsp.util.root_pattern ["package.json" ".git"])
                  :settings {:css  {:validate true} 
                             :less {:validate true}
                             :scss {:validate true}}})

(lsp.tsserver.setup {:root_dir (lsp.util.root_pattern "package.json")
                     :on_attach (fn [client bufnr] 
                                  (set client.resolved_capabilities.document_formatting false)
                                  (on_attach client bufnr))
; Sets rust-analyzer too
;(let [rust-tools (require "rust-tools")]
;  (rust-tools.setup {:server {:settings {:rust-analyzer {:procMacro {:enable false} 
;                                                         :diagnostics {:disabled {"macro-error" "unresolved-proc-macro"}}}}}
                     :tools {:inlay_hints {:show_parameter_hints false}}})

(let [sumneko_root_path (.. vim.env.HOME "/.local/share/lua-language-server")
      sumneko_binary (.. sumneko_root_path "/bin/Linux/lua-language-server")]
  (init-lsp 
    :sumneko_lua
    {:cmd [sumneko_binary "-E" (.. sumneko_root_path "/main.lua")]
     :settings {:Lua {:runtime {:version "LuaJIT"
                                :path (vim.split package.path ";")}
                      :diagnostics {:globals ["vim"]}
                      :workspace {:library {(vim.fn.expand "$VIMRUNTIME/lua") true
                                            (vim.fn.expand "$VIMRUNTIME/lua/vim/lsp") true}}
                      :telemetry false}}}))
; <<< 

(vim.cmd "highlight link LspSemantic_type Include")
(vim.cmd "highlight link LspSemantic_function Identifier")
(vim.cmd "highlight link LspSemantic_struct Number")
(vim.cmd "highlight LspSemantic_variable guifg=gray")
(vim.cmd "highlight link LspSemantic_keyword Structure")    

; vim:foldmarker=>>>,<<<
