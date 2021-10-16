(module config.plugins.todo-comments 
  {autoload {todo-comments todo-comments}}) 

(todo-comments.setup  
  {:keywords {:TODO {:icon " "}
              :WARN {:icon " " :alt [:WARNING :XXX :!!!]}
              :NOTE {:icon " " :alt [:INFO]} 
              :FIX  {:icon " " :alt [:FIXME :BUG :FIXIT :ISSUE :PHIX]} 
              :PERF {:icon " " :alt [:OPTIM :PERFORMANCE :OPTIMIZE]}
              :HACK {:icon " "}}}) 

; vim:foldmarker=>>>,<<<
