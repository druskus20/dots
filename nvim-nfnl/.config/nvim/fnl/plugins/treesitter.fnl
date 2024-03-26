[{1 :nvim-treesitter/nvim-treesitter
   :build ":TSUpdate"
   :cmd [:TSUpdateSync :TSUpdate :TSInstall]
   :config (fn [_ opts]
             (when (= (type opts.ensure_installed) :table)
               (local added {})
               (set opts.ensure_installed
                   (vim.tbl_filter (fn [lang]
                                     (when (. added lang) (lua "return false"))
                                     (tset added lang true)
                                     true)
                                   opts.ensure_installed)))
             ((. (require :nvim-treesitter.configs) :setup) opts))
   :event [:VeryLazy]
   :opts {:ensure_installed [:bash
                             :c
                             :diff
                             :html
                             :javascript
                             :jsdoc
                             :json
                             :jsonc
                             :lua
                             :luadoc
                             :luap
                             :markdown
                             :markdown_inline
                             :python
                             :query
                             :regex
                             :toml
                             :typescript
                             :vim
                             :vimdoc
                             :xml
                             :yaml]}
          ;:highlight {:enable true}
          ;:incremental_selection {:enable true
          ;                        :keymaps {:init_selection :<C-space>
          ;                                  :node_decremental :<bs>
          ;                                  :node_incremental :<C-space>
          ;                                  :scope_incremental false}}
          ;:indent {:enable true}
          ;:textobjects {:move {:enable true
          ;                     :goto_next_end {"]C" "@class.outer"
          ;                                     "]F" "@function.outer"}
          ;                     :goto_next_start {"]c" "@class.outer"
          ;                                       "]f" "@function.outer"}
          ;                     :goto_previous_end {"[C" "@class.outer"
          ;                                         "[F" "@function.outer"}
          ;                     :goto_previous_start {"[c" "@class.outer"
          ;                                           "[f" "@function.outer"}]}
   :version false}]                                                    	
