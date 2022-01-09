(module config.plugins.trouble 
  {autoload {trouble trouble}})

(trouble.setup
  {:width 50
   :position :bottom
   :fold_closed ""
   :signs {:error ""
           :hint ""
           :information ""
           :other "﫠"
           :warning ""}
   :fold_open ""
   :icons true
   :height 10
   :action_keys {:open_tab {1 :<c-t>}
                 :toggle_mode :m
                 :cancel :<esc>
                 :hover :K
                 :jump_close {1 :o}
                 :toggle_fold {1 :zA 2 :za}
                 :next :j
                 :preview :p
                 :toggle_preview :P
                 :close :q
                 :refresh :r
                 :previous :k
                 :open_folds {1 :zR 2 :zr}
                 :open_split {1 :<c-x>}
                 :close_folds {1 :zM 2 :zm}
                 :open_vsplit {1 :<c-v>}
                 :jump {1 :<cr> 2 :<tab>}}})
