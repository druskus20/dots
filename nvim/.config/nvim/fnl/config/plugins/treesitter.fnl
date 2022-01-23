(module config.plugins.treesitter 
  {autoload {utils config.utils
             a aniseed.core
             configs nvim-treesitter.configs}
   require-macros [config.macros]})

(configs.setup 
  {:ensure_installed []
  ; :ensure_installed "maintained" 
   :highlight {:enable true
               :disable ["fennel" "rust" "haskell"]}

   :incremental_selection {:enable false
                           :keymaps {:init_selection    "gss"
                                     :node_incremental  "gsl"
                                     :node_decremental  "gsh"
                                     :scope_incremental "gsj"
                                     :scope_decremental "gsk"}}

   ; Might fuck with gitsigns
   ;:rainbow {:enable true
             ;:extended_mode true}
   :context_commentstring {:enable true :disable ["rust" "fennel"]}

   :playground
   {:enable true
    :disable ["fennel"]
    :updatetime 25 ; Debounced time for highlighting nodes in the playground from source code
    :persist_queries false ; Whether the query persists across vim sessions
    :keybindings
    {:toggle_query_editor "o"
     :toggle_hl_groups "i"
     :toggle_injected_languages "t"
     :toggle_anonymous_nodes "a"
     :toggle_language_display "I"
     :focus_language "f"
     :unfocus_language "F"
     :update "R"
     :goto_node "<cr>"
     :show_help "?"}}})
     
