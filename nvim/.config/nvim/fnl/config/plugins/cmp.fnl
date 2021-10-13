(module config.plugins.cmp
  {autoload {a aniseed.core
             cmp cmp}})

; check this for coloring maybe
; https://github.com/hrsh7th/nvim-cmp/blob/ada9ddeff71e82ad0e52c9a280a1e315a8810b9a/lua/cmp/entry.lua#L199
(defn item-formatter [item vim-item]
  (let [padding (string.rep " " (- 10 (vim.fn.strwidth vim-item.abbr)))
        details (?. item :completion_item :detail)]
    (when details
      (set vim-item.abbr (.. vim-item.abbr padding " " details))))
  vim-item)

(cmp.setup 
  {:mapping {:<C-d> (cmp.mapping.scroll_docs (- 4))
             :<C-f> (cmp.mapping.scroll_docs 4)
             :<C-k> (cmp.mapping.select_prev_item {:behavior cmp.SelectBehavior.Insert})
             :<C-j> (cmp.mapping.select_next_item {:behavior cmp.SelectBehavior.Insert})
             :<C-e> (cmp.mapping.close)
             :<CR> (cmp.mapping.confirm {:select true})
             :<TAB> (cmp.mapping.confirm {:select true})
             :<C-Space> (cmp.mapping.complete)}

   :snippet {:expand (fn [args] ((. vim.fn "vsnip#anonymous") args.body))}
   :sources [{:name :nvim_lsp} 
             {:name :vsnip} 
             {:name :calc}
             {:name :path}
             {:name :conjure}
             {:name :crates}]
             ;{:name :buffer}]

   :completion {:completeopt "menu,menuone,noinsert"}

   :sorting {:comparators [#(do (if (= 15 ($1:get_kind)) false nil)) ; 15 means "SNIPPET", see https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/types/lsp.lua
                           cmp.config.compare.offset
                           cmp.config.compare.exact
                           cmp.config.compare.score
                           cmp.config.compare.kind
                           cmp.config.compare.sort_text
                           cmp.config.compare.length
                           cmp.config.compare.order]}

   :formatting {:format item-formatter}})
