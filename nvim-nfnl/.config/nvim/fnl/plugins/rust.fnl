; TODO: FIX
;(vim.cmd "autocmd FileType DressingInput imap <buffer> <C-j> <Down>")
;(vim.cmd "autocmd FileType DressingInput imap <buffer> <C-k> <Up>")
;(vim.cmd "autocmd FileType DressingSelect imap <buffer> <C-j> <Down>")
;(vim.cmd "autocmd FileType DressingSelect imap <buffer> <C-k> <Up>")
; TODO: Custom handlers for things. With titles and borders
; vim.lsp.buf.references
; vim.lsp.buf.handlers
; https://github.com/pbogut/dotfiles/blob/7ba96f5871868c1ce02f4b3832c1659637fb0c2c/config/nvim/lua/plugins/nvim_lsp.lua#L84
[
 {1 :stevearc/dressing.nvim 
  :enabled true
  :opts {:select { :backend [ "builtin"]
                    :builtin { :width nil
                               :max_width [ 140 0.8]
                               :min_width [ 20 0]
                               :height nil
                               :max_height 0.9
                               :min_height [ 0 0]

                               :title_pos :left
                               :border :single
                               :relative :cursor}}}} ; TODO: PR to make the window cursor right bellow the cursor
 {1 :hrsh7th/nvim-cmp
    :dependencies [{1 :Saecki/crates.nvim
                      :event ["BufRead Cargo.toml"]
                      :opts {:src {:cmp {:enabled true}}}}]}

 {1 :rust-lang/rust.vim :ft [:rust] :config #(do (set vim.g.rustfmt_autosave 1))}

 {1 :j-hui/fidget.nvim :event :LspAttach :config true :tag :legacy}

 ; Lazyvim does it with NOICE
 ; TODO: NOT WORKING
 ;{1 :ray-x/lsp_signature.nvim
 ;   :init (fn []
 ;           (set vim.g.navic_silence true)
 ;           ((. (require :util.lsp) :on_attach) (fn [client buffer]
 ;                                                   ((. (require :lsp_signature) :on_attach) client buffer))))
 ;   :event :VeryLazy
 ;   :config (fn [_ opts] ((. (require :lsp_signature) :setup) opts))}

 ; TODO Should this be configured as a "dependency of rust.vim?"
 ; Probably not, since :config probably wont merge with other nvim-lspconfig configs for other langs
 
 {1 :hashivim/vim-terraform}
 
 ; TODO: "Keys" not working
  ;{1 :simrat39/rust-tools.nvim
  {1 :MunifTanjim/rust-tools.nvim 
         :branch "patched"
         :ft [:rust]

         :opts (fn []
                 (local (ok mason-registry) (pcall require :mason-registry))
                 (var adapter nil)
                 (when ok
                   (local codelldb (mason-registry.get_package :codelldb))
                   (local extension-path (.. (codelldb:get_install_path) :/extension/))
                   (local codelldb-path (.. extension-path :adapter/codelldb))
                   (var liblldb-path "")
                   (set liblldb-path (.. extension-path :lldb/lib/liblldb.so))
                   (set adapter ((. (require :rust-tools.dap) :get_codelldb_adapter) codelldb-path
                                                                                     liblldb-path)))
                 {:dap {: adapter}
                  :tools {:autoSetHints true
                          :inlay_hints {:show_parameter_hints true
                                        :other_hints_prefix "» "
                                        :only_current_line_autocmd :CursorHold
                                        :only_current_line false
                                        :right_align_padding 7
                                        :parameter_hints_prefix "< "
                                        :right_align false
                                        :highlight "RustInlayHint"
                                        :max_len_align false
                                        :max_len_align_padding 1}
                          :on_initialized (fn [] (vim.cmd "                  
                              augroup RustLSP
                                autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                                autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                                autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                              augroup END 
                              "))}})}
  {1 :neovim/nvim-lspconfig
         :opts 
         {:servers {:rust_analyzer 
                    {
                     ; Works but not needed atm atm
                     ;:keys [{1 :K 2 :<cmd>RustHoverActions<cr> :desc "Hover Actions (Rust)"}
                     ;       {1 :<leader>mR 2 :<cmd>RustCodeAction<cr> :desc "Code Action (Rust)"}
                     ;       {1 :<leader>mr 2 :<cmd>RustDebuggables<cr> :desc "Run Debuggables (Rust)"}]
                     :settings {:rust-analyzer {:cargo {:allFeatures true
                                                        :loadOutDirsFromCheck true
                                                        :runBuildScripts true}
                                                :checkOnSave {:allFeatures true
                                                              :command :clippy
                                                              :extraArgs [:--no-deps]}
                                                :procMacro {:enable true 
                                                            :ignored {:async-recursion [:async_recursion] 
                                                                      :async-trait [:async_trait] 
                                                                      :napi-derive [:napi]}}}}} 

                    :terraformls {}
                    :terraform_lsp {}
                    :tsserver {}
                    :html {}
                    :zls {}
                    :ruff_lsp {}
                    :wgsl_analyzer {}
                    :yamlls {}
                    :helm_ls {}
                    :taplo {:keys [{1 :K
                                    2 (fn [] (if (and (= (vim.fn.expand "%:t")
                                                          :Cargo.toml)
                                                       ((. (require :crates)
                                                           :popup_available)))
                                                  ((. (require :crates)
                                                      :show_popup))
                                                  (vim.lsp.buf.hover)))
                                          :desc "Show Crate Documentation"}]}}}}
                ;:setup {:rust_analyzer (fn [_ opts]
                ;                         (local rust-tools-opts ((. (require :lazyvim.util) :opts) :rust-tools.nvim))
                ;                         ((. (require :rust-tools) :setup) (vim.tbl_deep_extend :force
                ;                                                                                (or rust-tools-opts
                ;                                                                                    {})
                ;                                                                                {:server opts}))
                ;                         true)}}}
; TODO: CMP STUFF
  {1 :hrsh7th/nvim-cmp}]

; TODO: Hightlight types
; vim.cmd("syntax region rustParamType start=\"\<[A-Z][A-Za-z0-9]*\<\" end=\">\" contains=rustType")
; vim.cmd("syntax match rustType "\<[A-Z][A-Za-z0-9]*\>"}}}}})))}]

