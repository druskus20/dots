
(local {: autoload} (require :nfnl.module))
; not good
(local colors (autoload :catppuccin.palettes.mocha))


[{1 :willothy/nvim-cokeline 
    :event :VeryLazy
    :opts {:components [{:text (fn [buffer]
                                 (.. " "
                                     buffer.devicon.icon))}
                        {:fg colors.base
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
           :default_hl {:bg (fn [buffer] (or (and buffer.is_focused
                                                  colors.blue)
                                             colors.base))
                        :fg (fn [buffer] (or (and buffer.is_focused
                                                  colors.base)
                                             colors.text))}}
           
    :config (fn [_ opts] 
              ((. (require :cokeline) :setup) opts))}]
                                                                                                              
              
              
    

