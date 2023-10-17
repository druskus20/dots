{1 :hrsh7th/nvim-cmp
 :config (fn [_ opts]
           (each [_ source (ipairs opts.sources)]
             (set source.group_index (or source.group_index 1)))
           ((. (require :cmp) :setup) opts))
 :dependencies [:hrsh7th/cmp-nvim-lsp
                :hrsh7th/cmp-buffer
                :hrsh7th/cmp-path]
 :event :InsertEnter
 :opts (fn []
         ;(vim.api.nvim_set_hl 0 :CmpGhostText {:default true :link :Comment})
         (local cmp (require :cmp))
         (local defaults ((require :cmp.config.default)))
         {:completion {:completeopt "menu,menuone,noinsert"}
          ;:experimental {:ghost_text {:hl_group :CmpGhostText}}
          :formatting {:format (fn [_ item]
                                 ; TODO: devicons does not seem to have the icons for this
                                 ; devicons 
                                  ;(local icon (. (. (require :nvim-web-devicons) :get_icon) item.kind))
                                  ;(print icon)
                                  ;;(local (icon hl-group)
                                  ;;      ((. (require :nvim-web-devicons) :get_icon) item.kind))
                                  ;(print item.kind)
                                  ;(set item.kind
                                  ;     (.. icon item.kind))
                                  item)}
          :mapping (cmp.mapping.preset.insert {:<C-CR> (fn [fallback]
                                                         (cmp.abort)
                                                         (fallback))
                                               ;:<C-Space> (cmp.mapping.complete)
                                               :<esc> (cmp.mapping.abort) ; close and delete 
                                               :<C-u> (cmp.mapping.scroll_docs (- 4))
                                               :<C-q> (cmp.mapping.abort)
                                               :<C-d> (cmp.mapping.scroll_docs 4)
                                               :<C-j> (cmp.mapping.select_next_item {:behavior cmp.SelectBehavior.Insert})
                                               :<C-k> (cmp.mapping.select_prev_item {:behavior cmp.SelectBehavior.Insert})
                                               :<CR> (cmp.mapping.confirm {:select true})
                                               :<tab> (cmp.mapping.confirm {:select true})
                                               :<S-CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Replace
                                                                             :select true})})
          :snippet {:expand (fn [args]
                              ((. (require :luasnip) :lsp_expand) args.body))}
          :sorting defaults.sorting
          :sources (cmp.config.sources [{:name :nvim_lsp}
                                        {:name :luasnip}
                                        {:name :path}]
                                       [{:name :buffer}])})
 :version false}


