; For which key keybinds
; (fn cmd [s desc] [(.. "<cmd>" s "<cr>") desc])
; (fn sel-cmd [s desc] [(.. "<cmd>'<,'>" s "<cr>") desc])

[{1 :folke/which-key.nvim
    :event :VeryLazy
    :init #(do (set vim.o.timeout true)
               (set vim.o.timeoutlen 300))
    :opts { :defaults { :mode { :n :v}}}
    :config (fn [_ opts] ; load which-key properly
              (let [wk (require "which-key")] 
                   (wk.setup opts)
                   (wk.register opts.defaults)))}]



