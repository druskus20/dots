
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


(local util (autoload :util))
(local map util.safe_keymap_set)

; TODO: Right way to do keymaps https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/keymaps.lua 
; Cant use "map" since it requires lazy.nvim to have fully loaded

; TODO: Should I even be using vim.keymap.set
; { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
;
; I think I should be using "LazyKeys" 
(vim.keymap.set [ "n" "v" ] "<leader>ma" vim.lsp.buf.code_action {:desc "Code Action"})

[{1 :rust-lang/rust.vim :ft [:rust]}
 {1 :neovim/nvim-lspconfig 
  :config (fn []
            (let [lsp (require :lspconfig) ]
              ;; To add support to more language servers check:
              ;; https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

              (lsp.rust_analyzer.setup {})))}]


; TODO: Hightlight types
; vim.cmd("syntax region rustParamType start=\"\<[A-Z][A-Za-z0-9]*\<\" end=\">\" contains=rustType")
; vim.cmd("syntax match rustType "\<[A-Z][A-Za-z0-9]*\>"})

