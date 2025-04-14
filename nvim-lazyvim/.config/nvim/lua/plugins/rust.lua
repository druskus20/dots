return {
  'neovim/nvim-lspconfig',
  opts = {
    setup = {
      -- Fix a problem with rust_analyzer being installed with lazyvim
      -- see `:h rustaceanvim.mason`
      rust_analyzer = function()
        return true
      end,
    },
  },
  {
    'mrcjkb/rustaceanvim',
    commit = '0f7e844', -- lock to nvim 0.10
  }
}
