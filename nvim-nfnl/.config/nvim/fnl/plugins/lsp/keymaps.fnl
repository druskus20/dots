;(local M {})
;(fn M.on_attach [_ buffer]
;  ; I think I should be using "LazyKeys"  (loading "after" everything else, on LSP attach)
;  (vim.keymap.set [ "n" "v" ] "<leader>mv" vim.lsp.buf.code_action {:desc "Code Action"})
;  (vim.keymap.set "n" "<leader>ma" vim.diagnostic.open_float {:desc "Line Diagnostics"})
;  (vim.keymap.set "n" "<leader>mg" vim.lsp.buf.definition {:desc "Goto Definition"})
;  (vim.keymap.set "n" "<leader>mr" vim.lsp.buf.rename {:desc "Rename"})
;  (vim.keymap.set "n" "<leader>mh" vim.lsp.buf.hover {:desc "Hover"})
;  (vim.keymap.set "n" "<leader>ms" vim.lsp.buf.references {:desc "Search References"}))
;M

; Rename with ESC mode - DOESNT WORK TODO
;(fn fancy_rename []
;  (vim.api.nvim_create_autocmd 
;    [:CmdlineEnter] {:callback 
;                      (fn [] 
;                        (local key (vim.api.nvim_replace_termcodes :<C-f> true false true)) 
;                        (vim.api.nvim_feedkeys key :c false)
;                        (vim.api.nvim_feedkeys :0 :n false)
;                        true)})
;  (vim.lsp.buf.rename)

; TODO: Nice macro for keymaps
(local M {})
(set M._keys nil)
(fn M.get []
  (when M._keys
    (let [___antifnl_rtn_1___ M._keys] (lua "return ___antifnl_rtn_1___"))) ; TODO: this is `return {}` in lua
  (set M._keys [
                ;{1 :<leader>cl 2 :<cmd>LspInfo<cr> :desc "Lsp Info"}
                ;{1 :<leader>md 2 (fn [] ((. (require :telescope.builtin) :lsp_definitions) {:reuse_win true})) :desc "Goto Definition" :has :definition}
                {1 :<leader>ms 2 "<cmd>Telescope lsp_references<cr>" :desc "References"}
                {1 :<leader>mg 2 vim.lsp.buf.declaration :desc "Goto Declaration"}
                {1 :<leader>ma 2 vim.diagnostic.open_float :desc "Line Diagnostics"}
                ;{1 :<leader>mI 2 (fn [] ((. (require :telescope.builtin) :lsp_implementations) {:reuse_win true})) :desc "Goto Implementation"}
                ;{1 :<leader>my 2 (fn [] ((. (require :telescope.builtin) :lsp_type_definitions) {:reuse_win true})) :desc "Goto T[y]pe Definition"}
                {1 :<leader>mh 2 vim.lsp.buf.hover :desc :Hover}
                ;{1 :mK 2 vim.lsp.buf.signature_help :desc "Signature Help" :has :signatureHelp}
                ;{1 :<c-k> 2 vim.lsp.buf.signature_help :desc "Signature Help" :has :signatureHelp :mode :i}
                {1 :<leader>mv 2 vim.lsp.buf.code_action :desc "Code Action" :has :codeAction :mode [:n :v]}
                {1 :<leader>mV 2 (fn [] (vim.lsp.buf.code_action {:context {:diagnostics {} :only [:source]}})) :desc "Source Action" :has :codeAction}
                {1 :<leader>mr 2 vim.lsp.buf.rename :desc :Rename :has :rename}])
                ;{1 :<leader>mr 2 fancy_rename :desc :Rename :has :rename}])
  M._keys)
(fn M.has [buffer method]
  (set-forcibly! method (or (and (method:find "/") method)
                            (.. :textDocument/ method)))
  (local clients
         ((. (require :util.lsp) :get_clients) {:bufnr buffer}))
  (each [_ client (ipairs clients)]
    (when (client.supports_method method) (lua "return true")))
  false)
(fn M.resolve [buffer]
  (let [Keys (require :lazy.core.handler.keys)]
    (when (not Keys.resolve)
      (let [___antifnl_rtn_1___ {}] (lua "return ___antifnl_rtn_1___")))
    (local spec (M.get))
    (local opts ((. (require :util) :opts) :nvim-lspconfig))
    (local clients
           ((. (require :util.lsp) :get_clients) {:bufnr buffer}))
    (each [_ client (ipairs clients)]
      (local maps (or (and (. opts.servers client.name)
                           (. (. opts.servers client.name) :keys))
                      {}))
      (vim.list_extend spec maps))
    (Keys.resolve spec)))
(fn M.on_attach [_ buffer]
  (let [Keys (require :lazy.core.handler.keys)
        keymaps (M.resolve buffer)]
    (each [_ keys (pairs keymaps)]
      (when (or (not keys.has) (M.has buffer keys.has))
        (local opts (Keys.opts keys))
        (set opts.has nil)
        (set opts.silent (not= opts.silent false))
        (set opts.buffer buffer)
        (vim.keymap.set (or keys.mode :n) keys.lhs keys.rhs opts)))))
M
