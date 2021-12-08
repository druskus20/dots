(module config.plugins.rust-tools
  {autoload {rust-tools rust-tools}})

(rust-tools.setup {:tools 
                   {:autoSetHints false
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
                      :diagnostics {:disabled ["macro-error" "unresolved-proc-macro"]}}}}})
