
[{1 :catppuccin/nvim
    :lazy false
    :priority 1000
    :enabled true 
    :name :catppuccin
    :config (fn [_ opts] 
                ((. (require :catppuccin) :setup) opts)
                (vim.cmd "colorscheme catppuccin")
                (local U (require :catppuccin.utils.colors))
                (local colors (require :catppuccin.palettes.mocha))
                (vim.api.nvim_set_hl 0 "DiagnosticVirtualTextError" {:bg (U.darken colors.red 0.07 colors.base) :fg (U.darken colors.red 0.65 colors.base)})
                (vim.api.nvim_set_hl 0 "DiagnosticVirtualTextWarn" {:bg (U.darken colors.yellow 0.04 colors.base) :fg (U.darken colors.yellow 0.25 colors.base)})
                (vim.api.nvim_set_hl 0 "DiagnosticVirtualTextInfo" {:bg (U.darken colors.sky 0.04 colors.base) :fg (U.darken colors.sky 0.25 colors.base)})
                (vim.api.nvim_set_hl 0 "DiagnosticVirtualTextHint" {:bg (U.darken colors.teal 0.02 colors.base) :fg (U.darken colors.teal 0.5 colors.base)}))
    :opts {:no_italic true
                    :no_bold true
                    :integrations {:alpha true}
                                  :cmp true
                                  :flash true
                                  :gitsigns true
                                  :illuminate true
                                  :indent_blankline {:enabled true}
                                  :lsp_trouble true
                                  :mason true
                                  :mini true
                                  :native_lsp {:enabled true
                                                :underlines {:errors [:undercurl]}
                                                            :hints [:undercurl]
                                                            :information [:undercurl]
                                                            :warnings [:undercurl]}
                                  :navic {:custom_bg :lualine :enabled true}
                                  :neotest true
                                  :neotree true
                                  :noice true
                                  :notify true
                                  :semantic_tokens true
                                  :telescope true
                                  :treesitter true
                                  :which_key true}}]
     


