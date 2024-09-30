; TODO: Put this inside config, we might need to merge tables
(fn show-macro-recording []
  (let [recording-register (vim.fn.reg_recording)]
    (if (= recording-register "") "" (.. "Recording @" recording-register))))                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	

[{1 :nvim-lualine/lualine.nvim
  :event :VeryLazy
  :enabled true
  :config (fn [_ opts] 
            (local lualine (require :lualine))
            (lualine.setup opts)
            
            ; https://www.reddit.com/r/neovim/comments/xy0tu1/comment/irfegvd/?utm_source=reddit&utm_medium=web2x&context=3
            (vim.api.nvim_create_autocmd :RecordingEnter
                                        {:callback (fn []
                                                      (lualine.refresh {:place [:statusline]}))}))
            ; It seems not needed
            ;(vim.api.nvim_create_autocmd :RecordingLeave
            ;                            {:callback (fn []
            ;                                          (local timer (vim.loop.new_timer))
            ;                                          (timer:start 50 0 (vim.schedule_wrap 
            ;                                                              (fn [] (lualine.refresh {:place [:statusline]})))))}))
  
  :opts (fn []
          ;(local icons (. (require :lazyvim.config) :icons))
          ;(local Util (require :lazyvim.util))
          {
           :extensions [:neo-tree :lazy]
           :options {:component_separators { :left :│ :right :│}
                     :section_separators { :left " " :right " "}  ; █
                     :disabled_filetypes {:statusline [:dashboard :alpha]}
                     :globalstatus true
                     :theme :auto}
           :sections {:lualine_a [:mode]
                      :lualine_b [:branch]
                      :lualine_c [{1 :diagnostics}
                                   ;:symbols {:error icons.diagnostics.Error
                                   ;          :hint icons.diagnostics.Hint
                                   ;          :info icons.diagnostics.Info
                                   ;          :warn icons.diagnostics.Warn}
                                   
                                  {1 :filetype
                                   :icon_only true
                                   :padding {:left 1 :right 0}
                                   :separator ""}
                                  {1 :filename
                                   :path 1
                                   :symbols {:modified "  "
                                             :readonly ""
                                             :unnamed ""}}]
                                  ; Configured in navic.fnl
                                  ;{1 (fn []
                                  ;     ((. (require :nvim-navic) :get_location))
                                  ; :cond (fn []
                                  ;         (and (. package.loaded :nvim-navic)
                                  ;              ((. (require :nvim-navic)
                                  ;                  :is_available))))}]
                      :lualine_x [{1 (fn []
                                       (.. "  " ((. (require :dap) :status))))
                                   ;:color (Util.fg :Debug)
                                   :cond (fn []
                                           (and (. package.loaded :dap)
                                                (not= ((. (require :dap)
                                                          :status))
                                                      "")))}
                                  {1 (. (require :lazy.status) :updates)
                                   ;:color (Util.fg :Special)
                                   :cond (. (require :lazy.status) :has_updates)}
                                  {1 :diff}]
                                   ;:symbols {:added icons.git.added
                                   ;          :modified icons.git.modified
                                   ;          :removed icons.git.removed}
                                   
                      :lualine_y [{1 :macro-recording :fmt show_macro_recording}
                                  {1 :location :padding {:left 0 :right 1}}]
                      :lualine_z []}
           :tabline { :lualine_b [{1 :buffers
                                     :max_length 99999999 ; TODO: change?
                                     :padding {:left 1 :right 1}
                                     :symbols {:alternate_file ""}}]}})}] ; TODO: Custom function

; TODO: Color for the tabline bg
; TODO: remove icon "padding" on iconless buffer



