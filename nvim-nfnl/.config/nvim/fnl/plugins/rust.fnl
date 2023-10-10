
(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

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

[{1 :rust-lang/rust.vim :ft [:rust] }
 {1 :neovim/nvim-lspconfig 
  :config (fn []
            (let [lsp (require :lspconfig)
                  ]
              ;; To add support to more language servers check:
              ;; https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

              ;; Clojure
              (lsp.rust_analyzer.setup {})
              (lsp.clojure_lsp.setup {:on_attach on_attach
                                      :handlers handlers
                                      :before_init before_init
                                      :capabilities capabilities})))}]


; TODO: Hightlight types
; vim.cmd("syntax region rustParamType start=\"\<[A-Z][A-Za-z0-9]*\<\" end=\">\" contains=rustType")
; vim.cmd("syntax match rustType "\<[A-Z][A-Za-z0-9]*\>"

