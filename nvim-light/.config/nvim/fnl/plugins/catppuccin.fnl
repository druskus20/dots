[{1 :catppuccin/nvim
    :lazy false
    :name :catppuccin
    :config (fn [] (vim.cmd "colorscheme catppuccin"))
    :opts {:integrations {:alpha true
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
                          :which_key true}}}]	
