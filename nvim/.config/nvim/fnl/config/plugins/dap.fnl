(module config.plugins.dap
  {autoload {utils config.utils}})

(vim.fn.sign_define :DapBreakpoint
                    {:numhl "" :linehl "" :text "●" :texthl "DapBreakpoint"})
(vim.fn.sign_define :DrapBreakpointCondition
                    {:numhl "" :linehl "" :text "●" :texthl "DapBreakpointCondition"})
(vim.fn.sign_define :DapLogPoint
                    {:numhl "" :linehl "" :text "●" :texthl "DapLogPoint"})
(vim.fn.sign_define :DapStopped
                    {:numhl "" :linehl "" :text "●" :texthl "DapStopped"})
(vim.fn.sign_define :DapBreakpointRejected
                    {:numhl "" :linehl "" :text "●" :texthl "DapBreakpointRejected"})



