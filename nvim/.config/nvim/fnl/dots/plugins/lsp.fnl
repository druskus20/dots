(module dots.plugins.lsp
  {autoload {a aniseed.core
             lsp lspconfig 
             lsp-configs lspconfig/configs
             utils dots.utils}

   require-macros [macros]})


; TODO check https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md for default config for all of them

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
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight() 
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END"
        false))))


(fn better_root_pattern [patterns except-patterns]
  "match path if one of the given patterns is matched, EXCEPT if one of the except-patterns is matched"
  (fn [path] 
    (when (not ((lsp.util.root_pattern except-patterns) path))
      ((lsp.util.root_pattern patterns) path))))

; advertise snippet support
(def default-capabilities
  (let [capabilities (vim.lsp.protocol.make_client_capabilities)]
    (set capabilities.textDocument.completion.completionItem.snippetSupport true)
    capabilities))

(fn init-lsp [lsp-name ?opts]
  "initialize a language server with defaults"
  (let [merged-opts (a.merge {:on_attach on_attach :capabilities default-capabilities} (or ?opts {}))]
    ((. lsp lsp-name :setup) merged-opts)))

; Added capabilities for rust-analyzer with nvim-compe
;(let [capabilities (vim.lsp.protocol.make_client_capabilities)]
  ;(set capabilities.textDocument.completion.completionItem.snippetSupport true)
  ;(set capabilities.textDocument.completion.completionItem.resolveSupport
       ;{:properties ["documentation" "detail" "additionalTextEdits"]})
  ;(init-lsp :rust_analyzer {:capabilities capabilities}))

(init-lsp :tsserver)
(init-lsp :jsonls   {:commands {:Format [ #(vim.lsp.buf.range_formatting [] [0 0] [(vim.fn.line "$") 0])]}})
;(init-lsp :denols   {:root_dir (better_root_pattern [".git"] ["package.json"])})
(init-lsp :hls      {:settings {:languageServerHaskell {:formattingProvider "stylish-haskell"}}})
(init-lsp :ocamllsp)
(init-lsp :vimls)
(init-lsp :bashls)
(init-lsp :erlangls)
(init-lsp :yamlls)
(init-lsp :html)
(init-lsp :gopls)
(init-lsp :purescriptls)

(init-lsp :cssls {:filestypes ["css" "scss" "less" "stylus"]
                  :root_dir (lsp.util.root_pattern ["package.json" ".git"])
                  :settings {:css  {:validate true} 
                             :less {:validate true}
                             :scss {:validate true}}})




(init-lsp :texlab
          {:settings {:texlab {:chktex {:onOpenAndSave true :onEdit true}
                               :build {:isContinuous true
                                       :args ["-pdf"
                                              "-pvc"
                                              "-synctex=1"
                                              "-interaction=nonstopmode" 
                                              "%f"]}}}})

                   
(let [rust-tools (require "rust-tools")]
  (rust-tools.setup {:tools {:inlay_hints {:show_parameter_hints false}}}))

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

(when (not lsp.prolog_lsp)
  (tset lsp-configs :prolog_lsp
       {:default_config {:cmd ["swipl" "-g" "use_module(library(lsp_server))." "-g" "lsp_server:main" "-t" "halt" "--" "stdio"]
                         :filetypes ["prolog"]
                         :root_dir (fn [fname] (or (lsp.util.find_git_ancestor fname) (vim.loop.os_homedir)))
                         :settings {}}}))

(lsp.prolog_lsp.setup {})




(se signcolumn "yes")



; vim:foldmarker=<<<<<,>>>>>
