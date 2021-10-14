; init.fnl
; Source the other parts of our config

(module config.init 
  {autoload {utils config.utils}})

(macro better-errors [f]
  `(xpcall #,f #(let [fennel# (require :aniseed.fennel)]
                  (a.println (fennel#.traceback $1)))))

(better-errors (require :config.plugins))
(better-errors (require :config.core))
(better-errors (require :config.keybinds))
