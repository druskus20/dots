(module config.plugins.symbols-outline
  { autoload {utils config.utils
              symbols-outline symbols-outline}})

; (set vim.opt.updatetime 500) ; might slow down vim

(set vim.g.symbols_outline 
     {:highlight_hovered_item false
      :relative_width false
      :width 35
      :floating {:enabled true :width 35 :height 30}
      :position :left ; float
      :show_numbers false
      :symbol_blacklist {}
      :preview_bg_highlight :Pmenu
      :auto_preview false
      :keymaps {:close {1 :<Esc> 2 :q}
                :toggle_preview :K
                :focus_location :o
                :goto_location [:<Cr> :<Tab>]
                :hover_symbol :<C-space>
                :rename_symbol :r
                :code_actions {}}
      :show_symbol_details false ; lsp
      :show_relative_numbers false
      :highlight_hovered_item true
      :show_guides true
      :auto_close true})
