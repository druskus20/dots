(module config.plugins.rust-tools
  {autoload {rust-tools rust-tools
             dap rust-tools.dap}})

; TODO: Euuuuuggh also dont hardcode druskus (vim.fn.getenv home)
(if (> (vim.fn.empty (vim.fn.glob "/home/druskus/.local/share/lldb/*")) 0)
  (vim.cmd "!/home/druskus/.config/nvim/download_lldb.sh /home/druskus/.local/share/lldb/"))
  
(def extension-path :/home/druskus/.local/share/lldb/lldb/)
(def codelldb-path (.. extension-path :adapter/codelldb))
(def liblldb-path (.. extension-path :lldb/lib/liblldb.so))

(vim.cmd "autocmd FileType rust nnoremap <localleader>d :RustDebuggables<CR>")
(vim.cmd "autocmd FileType rust nnoremap <localleader>r :RustRunnables<CR>")

(rust-tools.setup {:tools 
                    {:autoSetHints true
                     :inlay_hints {:show_parameter_hints true
                                   :other_hints_prefix "» "
                                   :only_current_line_autocmd :CursorHold
                                   :only_current_line false
                                   :right_align_padding 7
                                   :parameter_hints_prefix "< "
                                   :right_align false
                                   :highlight "RustInlayHint"
                                   :max_len_align false
                                   :max_len_align_padding 1}}
                   :server 
                    {:settings 
                     {:rust-analyzer
                      {:procMacro {:enable false} 
                       :diagnostics {:disabled ["macro-error" "unresolved-proc-macro"]}}}}
                   :dap
                    {:adapter ((. dap :get_codelldb_adapter) codelldb-path liblldb-path)}})

