[
  ;{1 :github/copilot.vim :event :VeryLazy}

  {1 :zbirenbaum/copilot.lua
      :opts {:suggestion { :enabled false}
             :panel { :enabled false}
             :filetypes { :rust true
                          :markdown true
                          :yaml true
                          :help true}}
      
     :build ":Copilot auth"}
  {1 :nvim-cmp
    :dependencies [{1 :zbirenbaum/copilot-cmp
                    :config (fn [_ opts]
                              (local copilot-cmp (require :copilot_cmp))
                              (copilot-cmp.setup opts)
                              ((. (require :util.lsp) :on_attach) (fn [client]
                                                                     (when (= client.name
                                                                             :copilot)
                                                                       (copilot-cmp._on_insert_enter {})))))
                    :dependencies :copilot.lua
                    :opts {}}]
    :opts (fn [_ opts]
            (table.insert opts.sources 1
                          {:group_index 1 :name :copilot :priority 100}))}]

