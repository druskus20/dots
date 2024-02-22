
(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local colors (autoload :catppuccin.palettes.mocha))


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


(local util (autoload :util))
(local map util.safe_keymap_set)



; TODO: Right way to do keymaps https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/keymaps.lua 
; Cant use "map" since it requires lazy.nvim to have fully loaded

; TODO: Should I even be using vim.keymap.set
; { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
;
; I think I should be using "LazyKeys"  (loading "after" everything else, on LSP attach)
(vim.keymap.set [ "n" "v" ] "<leader>mv" vim.lsp.buf.code_action {:desc "Code Action"})
(vim.keymap.set "n" "<leader>ma" vim.diagnostic.open_float {:desc "Line Diagnostics"})
(vim.keymap.set "n" "<leader>mg" vim.lsp.buf.definition {:desc "Goto Definition"})
(vim.keymap.set "n" "<leader>mr" vim.lsp.buf.rename {:desc "Rename"})
(vim.keymap.set "n" "<leader>mh" vim.lsp.buf.hover {:desc "Hover"})
(vim.keymap.set "n" "<leader>ms" vim.lsp.buf.references {:desc "Search References"})

; Set LSP diagnostic order 
(tset vim.lsp.handlers :textDocument/publishDiagnostics
      (vim.lsp.with vim.lsp.diagnostic.on_publish_diagnostics
                    {:severity_sort true}))

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
 
 {1 :MunifTanjim/rust-tools.nvim 
    :branch "patched"
 ;{1 :simrat39/rust-tools.nvim 
    :ft [:rust]
    ; set hightlight group
    :config (fn [_ opts] 
              (vim.api.nvim_set_hl 0 "RustInlayHint" {:fg "#505361"})
              ((. (require :rust-tools) :setup) opts))
    :opts {:tools {:autoSetHints true
                               :inlay_hints {:show_parameter_hints true
                                             :other_hints_prefix "» "
                                             :only_current_line_autocmd :CursorHold
                                             :only_current_line false
                                             :right_align_padding 7
                                             :parameter_hints_prefix "< "
                                             :right_align false
                                             :highlight "RustInlayHint"
                                             :max_len_align false
                                             :max_len_align_padding 1}}}}
 {1 :hashivim/vim-terraform}

 
; TODO: CMP STUFF
  {1 :hrsh7th/nvim-cmp}]

; TODO: Hightlight types
; vim.cmd("syntax region rustParamType start=\"\<[A-Z][A-Za-z0-9]*\<\" end=\">\" contains=rustType")
; vim.cmd("syntax match rustType "\<[A-Z][A-Za-z0-9]*\>"}}}}})))}]

