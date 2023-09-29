[{1 :nvim-telescope/telescope.nvim
  :dependencies [ :nvim-lua/plenary.nvim]
  :enabled true
  :cmd :Telescope
  :commit (or (and (= (vim.fn.has :nvim-0.9.0) 0) :057ee0f8783) nil)
  :keys [{1 "<leader>,"
          2 "<cmd>Telescope buffers show_all_buffers=true<cr>"
          :desc "Switch Buffer"}
         ;{1 :<leader>/ 2 (Util.telescope :live_grep) :desc "Grep (root dir)"}
         {1 "<leader>:"
          2 "<cmd>Telescope command_history<cr>"
          :desc "Command History"}
         ;{1 :<leader><space>
         ; 2 (Util.telescope :files)
         ; :desc "Find Files (root dir)"}
         {1 :<leader>fb 2 "<cmd>Telescope buffers<cr>" :desc :Buffers}
         ;{1 :<leader>ff
         ; 2 (Util.telescope :files)
         ; :desc "Find Files (root dir)"}
         ;{1 :<leader>fF
         ; 2 (Util.telescope :files {:cwd false})
         ; :desc "Find Files (cwd)"}
         {1 :<leader>fr 2 "<cmd>Telescope oldfiles<cr>" :desc :Recent}
         ;{1 :<leader>fR
         ; 2 (Util.telescope :oldfiles {:cwd (vim.loop.cwd)})
         ; :desc "Recent (cwd)"}
         {1 :<leader>gc 2 "<cmd>Telescope git_commits<CR>" :desc :commits}
         {1 :<leader>gs 2 "<cmd>Telescope git_status<CR>" :desc :status}
         {1 "<leader>s\"" 2 "<cmd>Telescope registers<cr>" :desc :Registers}
         {1 :<leader>sa
          2 "<cmd>Telescope autocommands<cr>"
          :desc "Auto Commands"}
         {1 :<leader>sb
          2 "<cmd>Telescope current_buffer_fuzzy_find<cr>"
          :desc :Buffer}
         {1 :<leader>sc
          2 "<cmd>Telescope command_history<cr>"
          :desc "Command History"}
         {1 :<leader>sC 2 "<cmd>Telescope commands<cr>" :desc :Commands}
         {1 :<leader>sd
          2 "<cmd>Telescope diagnostics bufnr=0<cr>"
          :desc "Document diagnostics"}
         {1 :<leader>sD
          2 "<cmd>Telescope diagnostics<cr>"
          :desc "Workspace diagnostics"}
         ;{1 :<leader>sg 2 (Util.telescope :live_grep) :desc "Grep (root dir)"}
         ;{1 :<leader>sG
         ; 2 (Util.telescope :live_grep {:cwd false})
         ; :desc "Grep (cwd)"}
         {1 :<leader>sh 2 "<cmd>Telescope help_tags<cr>" :desc "Help Pages"}
         {1 :<leader>sH
          2 "<cmd>Telescope highlights<cr>"
          :desc "Search Highlight Groups"}
         {1 :<leader>sk 2 "<cmd>Telescope keymaps<cr>" :desc "Key Maps"}
         {1 :<leader>sM 2 "<cmd>Telescope man_pages<cr>" :desc "Man Pages"}
         {1 :<leader>sm 2 "<cmd>Telescope marks<cr>" :desc "Jump to Mark"}
         {1 :<leader>so 2 "<cmd>Telescope vim_options<cr>" :desc :Options}
         {1 :<leader>sR 2 "<cmd>Telescope resume<cr>" :desc :Resume}]
         ;{1 :<leader>sw
         ; 2 (Util.telescope :grep_string {:word_match :-w})
         ; :desc "Word (root dir)"}
         ;{1 :<leader>sW
         ; 2 (Util.telescope :grep_string {:cwd false :word_match :-w})
         ; :desc "Word (cwd)"}
         ;{1 :<leader>sw
         ; 2 (Util.telescope :grep_string)
         ; :desc "Selection (root dir)"
         ; :mode :v}
         ;{1 :<leader>sW
         ; 2 (Util.telescope :grep_string {:cwd false})
         ; :desc "Selection (cwd)"
         ; :mode :v}
         ;{1 :<leader>uC
         ; 2 (Util.telescope :colorscheme {:enable_preview true})
         ; :desc "Colorscheme with preview"}
         ;{1 :<leader>ss
         ; 2 (Util.telescope :lsp_document_symbols
         ;                   {:symbols [:Class
         ;                              :Function
         ;                              :Method
         ;                              :Constructor
         ;                              :Interface
         ;                              :Module
         ;                              :Struct
         ;                              :Trait
         ;                              :Field
         ;                              :Property]})
         ; :desc "Goto Symbol"}
         ;{1 :<leader>sS
         ; 2 (Util.telescope :lsp_dynamic_workspace_symbols
         ;                   {:symbols [:Class
         ;                              :Function
         ;                              :Method
         ;                              :Constructor
         ;                              :Interface
         ;                              :Module
         ;                              :Struct
         ;                              :Trait
         ;                              :Field
         ;                              :Property]})
         ; :desc "Goto Symbol (Workspace)"}
         
  :opts {:defaults {:mappings {:i {:<C-Down> (fn [...]
                                               ((. (require :telescope.actions)
                                                   :cycle_history_next) ...))
                                   :<C-Up> (fn [...]
                                             ((. (require :telescope.actions)
                                                 :cycle_history_prev) ...))
                                   :<C-b> (fn [...]
                                            ((. (require :telescope.actions)
                                                :preview_scrolling_up) ...))
                                   :<C-f> (fn [...]
                                            ((. (require :telescope.actions)
                                                :preview_scrolling_down) ...))
                                   :<a-h> (fn []
                                            (local action-state
                                                   (require :telescope.actions.state))
                                            (local line
                                                   (action-state.get_current_line)))
                                            ;((Util.telescope :find_files
                                            ;                 {:default_text line
                                            ;                  :hidden true}))
                                            
                                   :<a-i> (fn []
                                            (local action-state
                                                   (require :telescope.actions.state))
                                            (local line
                                                   (action-state.get_current_line)))
                                            ;((Util.telescope :find_files
                                            ;                 {:default_text line
                                            ;                  :no_ignore true}))
                                            
                                   :<a-t> (fn [...]
                                            ((. (require :trouble.providers.telescope)
                                                :open_selected_with_trouble) ...))
                                   :<c-t> (fn [...]
                                            ((. (require :trouble.providers.telescope)
                                                :open_with_trouble) ...))}
                               :n {:q (fn [...]
                                        ((. (require :telescope.actions) :close) ...))}}
                    :prompt_prefix " "
                    :selection_caret " "}}
  :version false}]
