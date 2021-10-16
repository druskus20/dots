(module config.plugins.todo-comments 
  {autoload {todo-comments todo-comments}}) 

(todo-comments.setup  
  {:keywords {:TODO {:icon " " :color :info}
              :WARN {:alt [:WARNING :XXX :!!!]
                     :icon " "
                     :color :warning}
              :NOTE {:alt [:INFO] :icon " " :color :hint}
              :FIX {:alt [:FIXME :BUG :FIXIT :ISSUE]
                    :icon " "
                    :color :error}
              :HACK {:icon " " :color :warning}
              :PERF {:icon " "
                     :alt [:OPTIM :PERFORMANCE :OPTIMIZE]}}})

; vim:foldmarker=>>>,<<<
