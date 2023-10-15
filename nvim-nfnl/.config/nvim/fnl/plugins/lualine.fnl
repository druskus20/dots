;[{1 :nvim-lualine/lualine.nvim 
;    ;:event :VeryLazy 
;    :lazy false
;    ;:dependencies { 1: "hrsh7th/cmp-nvim-lsp" }
;    :options { :theme  :custom_gruvbox }
;    }]


[{1 :nvim-lualine/lualine.nvim
  :event :VeryLazy
  :enabled true
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
                                             :unnamed ""}}
                                  {1 (fn []
                                       ((. (require :nvim-navic) :get_location)))
                                   :cond (fn []
                                           (and (. package.loaded :nvim-navic)
                                                ((. (require :nvim-navic)
                                                    :is_available))))}]
                      :lualine_x [{1 (fn []
                                       ((. (. (. (. (require :noice) :api)
                                                 :status)
                                              :command)
                                           :get)))
                                   ;:color (Util.fg :Statement)
                                   :cond (fn []
                                           (and (. package.loaded :noice)
                                                ((. (. (. (. (require :noice)
                                                             :api)
                                                          :status)
                                                       :command)
                                                    :has))))}
                                  {1 (fn []
                                       ((. (. (. (. (require :noice) :api)
                                                 :status)
                                              :mode)
                                           :get)))
                                   ;:color (Util.fg :Constant)
                                   :cond (fn []
                                           (and (. package.loaded :noice)
                                                ((. (. (. (. (require :noice)
                                                             :api)
                                                          :status)
                                                       :mode)
                                                    :has))))}
                                  {1 (fn []
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
                                   
                      :lualine_y [{1 :progress
                                   :padding {:left 1 :right 0}
                                   :separator " "}
                                  {1 :location :padding {:left 0 :right 1}}]
                      :lualine_z [(fn [] (.. " " (os.date "%R")))]}})}]
