(module config.plugins.zen-mode
  {autoload {zen-mode zen-mode}})

(zen-mode.setup 
  {:window {:backdrop 0.95
            :width 80
            :height 0.8
            :options {:wrap true
                      :relativenumber false
                      :number false
                      :cursorline false}
            :plugins 
              {:gitsigns {:enabled true}
               :options {:showcmd false
                         :ruler false
                         :enabled true}
               :twilight {:enabled true}}}})
