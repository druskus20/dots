(module config.plugins.bufferline
  {autoload {colors config.colors
             bufferline bufferline}})

(let [selected {:gui "" :guibg colors.neutral_purple :guifg colors.dark0}
      visible  {:gui "" :guibg colors.dark1        :guifg colors.neutral_purple}]

  (bufferline.setup 
    {:options 
     {:diagnostics "nvim_lsp"
      :diagnostics_indicator (fn [cnt lvl diagnostics-dict] (tostring cnt))
      :show_buffer_close_icons false
      :show_buffer_icons false
      :show_close_icon false
      :show_tab_indicators false
      :enforce_regular_tabs false
      :tab_size 10}
     :highlights 
     {:fill {:guibg colors.dark0 :guifg colors.light0}
      :background visible
      :separator visible
      :buffer_visible visible
      :buffer_selected selected
      :indicator_selected {:guibg colors.neutral_purple :guifg colors.neutral_purple}

      :duplicate visible
      :duplicate_visible visible
      :duplicate_selected selected
      :modified visible
      :modified_visible visible
      :modified_selected selected
      :error visible
      :error_selected selected
      :error_visible selected
      :warning visible
      :warning_selected selected
      :warning_visible visible
    
      ; LSP stuff
      :diagnostic                  {:gui "" :guibg colors.dark1        :guifg colors.neutral_red}
      :diagnostic_visible          {:gui "" :guibg colors.dark1        :guifg colors.neutral_red}
      :diagnostic_selected         {:gui "" :guibg colors.neutral_purple :guifg colors.faded_red}
      :info_diagnostic             {:gui "" :guibg colors.dark1        :guifg colors.neutral_blue}
      :info_diagnostic_visible     {:gui "" :guibg colors.dark1        :guifg colors.neutral_blue}
      :info_diagnostic_selected    {:gui "" :guibg colors.neutral_purple :guifg colors.faded_blue}
      :warning_diagnostic          {:gui "" :guibg colors.dark1        :guifg colors.neutral_yellow}
      :warning_diagnostic_visible  {:gui "" :guibg colors.dark1        :guifg colors.neutral_yellow}
      :warning_diagnostic_selected {:gui "" :guibg colors.neutral_purple :guifg colors.faded_yellow}
      :error_diagnostic            {:gui "" :guibg colors.dark1        :guifg colors.neutral_red}
      :error_diagnostic_visible    {:gui "" :guibg colors.dark1        :guifg colors.neutral_red}
      :error_diagnostic_selected   {:gui "" :guibg colors.neutral_purple :guifg colors.red}

      ; Shortcuts for :BufferLinePick
      :pick_selected {:gui "bold" :guibg colors.neutral_purple :guifg colors.dark0} 
      :pick {:gui "" :guibg colors.dark1 :guifg colors.neutral_red}}}))



