; Loaded on "VeryLazy" event. 

(fn augroup [name]
  (vim.api.nvim_create_augroup (.. :drusk_ name) {:clear true}))                                                                                                                                                                                                                                                                                                                                                    	

; Highlight on yank 
(vim.api.nvim_create_autocmd :TextYankPost
                             {:callback (fn [] (vim.highlight.on_yank)) :group (augroup :highlight_yank)})

; Resize splits if window got resized
(vim.api.nvim_create_autocmd [:VimResized]
                             {:callback (fn []
                                          (local current-tab (vim.fn.tabpagenr))
                                          (vim.cmd "tabdo wincmd =")
                                          (vim.cmd (.. "tabnext " current-tab)))
                              :group (augroup :resize_splits)})


; Close popup windows with q
(vim.api.nvim_create_autocmd :FileType
                             {:callback (fn [event]
                                          (tset (. vim.bo event.buf) :buflisted
                                                false)
                                          (vim.keymap.set :n :q :<cmd>close<cr>
                                                          {:buffer event.buf
                                                           :silent true}))
                              :group (augroup :close_with_q)
                              :pattern [:PlenaryTestPopup
                                        :help
                                        :lspinfo
                                        :man
                                        :notify
                                        :qf
                                        :query
                                        :spectre_panel
                                        :startuptime
                                        :tsplayground
                                        :neotest-output
                                        :checkhealth
                                        :neotest-summary
                                        :neotest-output-panel]})

; Set wrap and spell for gitcommit and markdown
(vim.api.nvim_create_autocmd :FileType
                             {:callback (fn [] (set vim.opt_local.wrap true)
                                          (set vim.opt_local.spell true))
                              :group (augroup :wrap_spell)
                              :pattern [:gitcommit :markdown]})

; Auto create dir when saving a file, in case some intermediate directory does not exist
(vim.api.nvim_create_autocmd [:BufWritePre]
                             {:callback (fn [event]
                                          (when (event.match:match "^%w%w+://")
                                            (lua "return "))
                                          (local file
                                                 (or (vim.loop.fs_realpath event.match)
                                                     event.match))
                                          (vim.fn.mkdir (vim.fn.fnamemodify file
                                                                            ":p:h")
                                                        :p))
                              :group (augroup :auto_create_dir)})
