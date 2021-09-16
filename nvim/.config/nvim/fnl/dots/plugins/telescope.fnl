(module dots.plugins.telescope
  {autoload {utils dots.utils
             telescope telescope
             actions telescope.actions}})

(defn open-zathura [buffnumber] 
  (let [selected_entry (actions.get_selected_entry)]
    (vim.fn.system (.. "zathura " selected_entry.cwd "/" (. selected_entry 1) " & "))))



(telescope.setup 
  {:defaults {:mappings {:n {:<C-z> open-zathura} 
                         :i {:<esc> actions.close}}}})
