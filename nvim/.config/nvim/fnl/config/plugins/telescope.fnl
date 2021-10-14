(module config.plugins.telescope
  {autoload {utils config.utils
             telescope telescope
             actions telescope.actions}})

(telescope.setup 
  {:defaults {:mappings {:i {:<esc> actions.close}}
              :file_ignore_patterns ["Cargo.lock" ".*.snap"]}})

; vim:foldmarker=>>>,<<<
