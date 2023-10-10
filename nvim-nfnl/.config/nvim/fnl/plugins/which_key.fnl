[{1 :folke/which-key.nvim
    :enabled true
    :lazy false
    :event :VeryLazy
    :init #(do (set vim.o.timeout true)
               (set vim.o.timeoutlen 300))
    :opts { :defaults { :mode { :n :v}}}
    :config (fn [_ opts] ; load which-key properly
              (let [wk (require "which-key")] 
                   (wk.setup opts)
                   (wk.register opts.defaults)))}]



