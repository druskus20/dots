(local {: autoload} (require :nfnl.module))
(local colors (autoload :catppuccin.palettes.mocha))

; Remove borders from floating windows
(vim.api.nvim_set_hl 0 "NormalBorder" {:bg colors.mantle :fg colors.mantle})
(vim.api.nvim_set_hl 0 "FloatBorder" {:bg colors.mantle :fg colors.mantle})
(vim.api.nvim_set_hl 0 "FloatTitle" {:bg colors.red :fg colors.crust})
