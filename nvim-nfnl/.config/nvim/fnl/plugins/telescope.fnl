;  
; TelescopePromptPrefix = {
;                          fg = colors.red,
;                          bg = colors.black2,}
;  ,
;
;  TelescopeNormal = { bg = colors.darker_black },
;
;  TelescopePreviewTitle = {
;                           fg = colors.black,
;                           bg = colors.green,}
;  ,
;
;  TelescopePromptTitle = {
;                          fg = colors.black,
;                          bg = colors.red,}
;  ,
;
;  TelescopeSelection = { bg = colors.black2, fg = colors.white },
;  TelescopeResultsDiffAdd = { fg = colors.green },
;  TelescopeResultsDiffChange = { fg = colors.yellow },
;  TelescopeResultsDiffDelete = { fg = colors.red },

;vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg=0, bg=LightGrey })

 

(local Util (require :util))
(local {: autoload} (require :nfnl.module))



[{1 :nvim-telescope/telescope.nvim
    :dependencies [ :nvim-lua/plenary.nvim
                    {1 :nvim-telescope/telescope.nvim
                       :cmd :Telescope
                       :version false
                       :dependencies [{1 :nvim-telescope/telescope-fzf-native.nvim
                                         :build :make
                                         :config (fn [] (Util.on_load :telescope.nvim (fn [] ((. (require :telescope) :load_extension) :fzf))))}]}]
    :config (fn [_ opts] 
              ; TODO: Loading colors like this maybe its not the best?
              (local colors (autoload :catppuccin.palettes.mocha))

              (vim.api.nvim_set_hl 0 "TelescopePromptPrefix" {:bg colors.mantle :fg colors.red})
              (vim.api.nvim_set_hl 0 "TelescopePromptTitle" {:bg colors.red :fg colors.crust})
              (vim.api.nvim_set_hl 0 "TelescopeSelection" {:bg colors.base :fg colors.text})
              (vim.api.nvim_set_hl 0 "TelescopeResultsDiffAdd" {:fg colors.green})
              (vim.api.nvim_set_hl 0 "TelescopeResultsDiffChange" {:fg colors.yellow})
              (vim.api.nvim_set_hl 0 "TelescopeResultsDiffDelete" {:fg colors.red})

              ;vim.api.nvim_set_hl 0 “FloatBorder” {bg=“#3B4252” fg=“#5E81AC”}
              ;vim.api.nvim_set_hl(0, “NormalFloat” {bg=“#3B4252”})
              ;vivim.api.nvim_set_hl(0, “TelescopeNormal”, {bg=“#3B4252”})
              ;vivim.api.nvim_set_hl(0, “TelescopeBorder”, {bg=“#3B4252”})

              (vim.api.nvim_set_hl 0 "TelescopeNormal" {:bg colors.mantle})
              (vim.api.nvim_set_hl 0 "TelescopeBorder" {:bg colors.mantle :fg colors.mantle})

              ; borderless
              (vim.api.nvim_set_hl 0 "TelescopeBorder" {:bg colors.mantle :fg colors.mantle})
              (vim.api.nvim_set_hl 0 "TelescopePromptBorder" {:bg colors.mantle :fg colors.mantle})
              (vim.api.nvim_set_hl 0 "TelescopePromptNormal" {:bg colors.mantle :fg colors.text})
              (vim.api.nvim_set_hl 0 "TelescopeResultsTitle" {:bg colors.red :fg colors.crust})
              (vim.api.nvim_set_hl 0 "TelescopePromptPrefix" {:bg colors.mantle :fg colors.red})
              ((. (require :telescope) :setup) opts))
    :cmd :Telescope
    :keys [{1 "<leader>,"
            2 "<cmd>Telescope buffers show_all_buffers=true<cr>"
            :desc "Switch Buffer"}
           {1 :<leader>p  ; TODO: Look at LavyVim's Util.telescope function for this
            2 "<cmd>Telescope find_files<cr>"
            :desc "Find Files"}
           {1 :<C-p>
            2 "<cmd>Telescope find_files<cr>"
            :desc "Find Files"}
           {1 :<leader>o 
            2 "<cmd>Telescope live_grep<cr>"
            :desc "Grep"}
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
                             ;
;
;
;     defaults = {
;        mappings = {
;            i = {
;                ["<esc>"] = actions.close,
;            },
;        },

    :opts {:defaults {:mappings {:i {:<esc> (fn [...] ((. (require :telescope.actions) :close) ...))
                                     :<C-u> (fn [...]
                                              ((. (require :telescope.actions)
                                                  :preview_scrolling_up) ...))
                                     :<C-d> (fn [...]
                                              ((. (require :telescope.actions)
                                                  :preview_scrolling_down) ...))
                                     :<C-j> (fn [...]
                                              ((. (require :telescope.actions)
                                                  :move_selection_next) ...))
                                     :<C-k> (fn [...]
                                              ((. (require :telescope.actions)
                                                  :move_selection_previous) ...))}
                                 :n {:q (fn [...]
                                          ((. (require :telescope.actions) :close) ...))}}
                      :prompt_prefix " "
                      :selection_caret " "
                        :version false}}}]


 
