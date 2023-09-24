(local opts {:no_italic true
             :no_bold true
             :integrations {:alpha true
                            :cmp true
                            :flash true
                            :gitsigns true
                            :illuminate true
                            :indent_blankline {:enabled true}
                            :lsp_trouble true
                            :mason true
                            :mini true
                            :native_lsp {:enabled true
                                         :underlines {:errors [:undercurl]
                                                      :hints [:undercurl]
                                                      :information [:undercurl]
                                                      :warnings [:undercurl]}}
                            :navic {:custom_bg :lualine :enabled true}
                            :neotest true
                            :neotree true
                            :noice true
                            :notify true
                            :semantic_tokens true
                            :telescope true
                            :treesitter true
                            :which_key true}})


[{1 :catppuccin/nvim
    :lazy false
    :enabled true 
    :name :catppuccin
    :config (fn []
                 ((. (require :catppuccin) :setup) opts)
                 (vim.cmd "colorscheme catppuccin"))}]


