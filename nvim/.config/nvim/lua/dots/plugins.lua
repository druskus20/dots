local _2afile_2a = "dots/plugins.fnl"
local _1_
do
  local name_4_auto = "dots.plugins"
  local module_5_auto
  do
    local x_6_auto = _G.package.loaded[name_4_auto]
    if ("table" == type(x_6_auto)) then
      module_5_auto = x_6_auto
    else
      module_5_auto = {}
    end
  end
  module_5_auto["aniseed/module"] = name_4_auto
  module_5_auto["aniseed/locals"] = ((module_5_auto)["aniseed/locals"] or {})
  do end (module_5_auto)["aniseed/local-fns"] = ((module_5_auto)["aniseed/local-fns"] or {})
  do end (_G.package.loaded)[name_4_auto] = module_5_auto
  _1_ = module_5_auto
end
local autoload
local function _3_(...)
  return (require("aniseed.autoload")).autoload(...)
end
autoload = _3_
local function _6_(...)
  local ok_3f_21_auto, val_22_auto = nil, nil
  local function _5_()
    return {}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {["require-macros"] = {macros = true}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.plugins"
do local _ = ({nil, _1_, nil, {{nil}, nil, nil, nil}})[2] end
local packer_15_auto = require("packer")
local function _9_(_8_)
  _8_({"elkowar/kmonad.vim"})
  _8_({"elkowar/antifennel-nvim"})
  _8_({"elkowar/yuck.vim"})
  _8_({"rktjmp/lush.nvim"})
  local function _10_()
    return require("dots.plugins.sourcery")
  end
  _8_({"druskus20/sourcery", config = _10_, requires = {"rktjmp/lush.nvim"}})
  local function _11_()
    return require("dots.plugins.telescope")
  end
  _8_({"nvim-telescope/telescope.nvim", cmd = {"Telescope"}, config = _11_, requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}})
  _8_({"kyazdani42/nvim-web-devicons"})
  local function _12_()
    return require("dots.plugins.treesitter")
  end
  _8_({"nvim-treesitter/nvim-treesitter", config = _12_, event = {"BufEnter"}, run = ":TSUpdate"})
  _8_({"JoosepAlviste/nvim-ts-context-commentstring", event = {"BufEnter"}, requires = {"nvim-treesitter/nvim-treesitter"}})
  _8_({"nvim-treesitter/playground", event = {"BufEnter"}, requires = {"nvim-treesitter/nvim-treesitter"}})
  _8_({"prettier/vim-prettier"})
  _8_({"jiangmiao/auto-pairs"})
  _8_({"folke/which-key.nvim"})
  _8_({"Olical/aniseed"})
  _8_({"norcalli/nvim.lua"})
  local function _13_()
    return require("dots.plugins.feline")
  end
  _8_({"Famiu/feline.nvim", config = _13_})
  local function _14_()
    return require("dots.plugins.bufferline")
  end
  _8_({"akinsho/nvim-bufferline.lua", config = _14_})
  local function _15_()
    return require("dots.plugins.diffview")
  end
  _8_({"sindrets/diffview.nvim", cmd = {"DiffviewOpen", "DiffviewToggleFiles"}, config = _15_})
  _8_({"tweekmonster/startuptime.vim", cmd = {"StartupTime"}})
  _8_({"tpope/vim-repeat"})
  local function _16_()
    return require("dots.plugins.zen-mode")
  end
  _8_({"folke/zen-mode.nvim", config = _16_})
  local function _17_()
    return require("dots.plugins.gitsigns")
  end
  _8_({"lewis6991/gitsigns.nvim", config = _17_})
  _8_({"tpope/vim-fugitive"})
  _8_({"preservim/nerdcommenter"})
  _8_({"godlygeek/tabular", cmd = {"Tabularize"}})
  _8_({"tpope/vim-surround"})
  _8_({"nathanaelkane/vim-indent-guides"})
  _8_({"terryma/vim-multiple-cursors"})
  _8_({"mg979/vim-visual-multi"})
  _8_({"hauleth/sad.vim"})
  _8_({"wellle/targets.vim"})
  _8_({"ray-x/lsp_signature.nvim", events = {"BufEnter"}})
  local function _18_()
    return require("dots.plugins.trouble")
  end
  _8_({"folke/lsp-trouble.nvim", cmd = {"Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle"}, config = _18_})
  local function _19_()
    return require("dots.plugins.symbols-outline")
  end
  _8_({"simrat39/symbols-outline.nvim", config = _19_})
  _8_({"neovim/nvim-lspconfig"})
  local function _20_()
    return require("dots.plugins.compe")
  end
  _8_({"hrsh7th/nvim-compe", config = _20_})
  local function _21_()
    return require("dots.plugins.lspsaga")
  end
  _8_({"glepnir/lspsaga.nvim", config = _21_})
  _8_({"Olical/conjure"})
  _8_({"tami5/compe-conjure", requires = {"Olical/conjure"}})
  local function _22_()
    return require("dots.plugins.detect-indent")
  end
  _8_({"ciaranm/detectindent", config = _22_})
  _8_({"pechorin/any-jump.vim"})
  local function _23_()
    return require("dots.plugins.sneak")
  end
  _8_({"justinmk/vim-sneak", config = _23_})
  _8_({"psliwka/vim-smoothie"})
  _8_({"editorconfig/editorconfig-vim"})
  _8_({"tommcdo/vim-exchange"})
  _8_({"eraserhd/parinfer-rust", run = "cargo build --release"})
  _8_({"kevinoid/vim-jsonc"})
  local function _24_()
    return require("dots.plugins.nvim-colorizer")
  end
  _8_({"norcalli/nvim-colorizer.lua", config = _24_})
  _8_({"pangloss/vim-javascript"})
  _8_({"ianks/vim-tsx"})
  _8_({"leafgarland/typescript-vim"})
  _8_({"HerringtonDarkholme/yats.vim"})
  _8_({"mxw/vim-jsx"})
  local function _25_()
    return require("dots.plugins.emmet")
  end
  _8_({"mattn/emmet-vim", config = _25_})
  _8_({"purescript-contrib/purescript-vim"})
  _8_({"vmchale/dhall-vim"})
  _8_({"neovimhaskell/haskell-vim", ft = {"haskell"}})
  local function _26_()
    vim.g.rustfmt_fail_silently = 1
    return nil
  end
  _8_({"rust-lang/rust.vim", config = _26_, ft = {"rust"}, requires = {"mattn/webapi-vim"}})
  _8_({"simrat39/rust-tools.nvim"})
  _8_({"qnighy/lalrpop.vim"})
  _8_({"bakpakin/fennel.vim"})
  return _8_({"google/vim-jsonnet"})
end
return packer_15_auto.startup(_9_)