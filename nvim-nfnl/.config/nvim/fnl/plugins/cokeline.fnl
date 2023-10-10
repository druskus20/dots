[{1 :willothy/nvim-cokeline 
    :event :VeryLazy
    :config (fn [] 
              (local get-hex (. (require :cokeline.hlgroups) :get_hl_attr))
              ((. (require :cokeline) :setup) {:components [{:fg (fn [buffer]
                                                                   buffer.devicon.color)
                                                             :text (fn [buffer]
                                                                     (.. " "
                                                                         buffer.devicon.icon))}
                                                            {:fg (get-hex :Comment :fg)
                                                             :italic true
                                                             :text (fn [buffer]
                                                                     buffer.unique_prefix)}
                                                            {:text (fn [buffer]
                                                                     (.. buffer.filename " "))
                                                             :underline (fn [buffer]
                                                                          (and buffer.is_hovered
                                                                               (not buffer.is_focused)))}
                                                            {:on_click (fn [_ _ _ _ buffer]
                                                                         (buffer:delete))
                                                             :text ""}
                                                            {:text " "}]
                                               :default_hl {:bg (fn [buffer]
                                                                  (or (and buffer.is_focused
                                                                           (get-hex :Normal
                                                                                    :fg))
                                                                      (get-hex :ColorColumn
                                                                               :bg)))
                                                            :fg (fn [buffer]
                                                                  (or (and buffer.is_focused
                                                                           (get-hex :ColorColumn
                                                                                    :bg))
                                                                      (get-hex :Normal :fg)))}}))}]
                                                                               	
              
              
    

