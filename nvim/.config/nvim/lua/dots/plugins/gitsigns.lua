local _2afile_2a = "dots/plugins/gitsigns.fnl"
local _1_
do
  local name_4_auto = "dots.plugins.gitsigns"
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
    return {autoload("dots.colors"), autoload("gitsigns"), autoload("dots.utils")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {colors = "dots.colors", gitsigns = "gitsigns", utils = "dots.utils"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local colors = _local_4_[1]
local gitsigns = _local_4_[2]
local utils = _local_4_[3]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.plugins.gitsigns"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
gitsigns.setup({current_line_blame = false, keymaps = {buffer = true, noremap = true}, signs = {add = {text = "\226\150\141"}, change = {text = "\226\150\141"}, changedelete = {text = "\226\150\141"}, delete = {text = "\226\150\141"}, topdelete = {text = "\226\150\141"}}, update_debounce = 100})
return vim.cmd(("\n    augroup gitsignsHighlight\n    autocmd ColorScheme * :hi! GitSignsAdd    gui='NONE' guibg='NONE' guifg='" .. colors.bright_aqua .. "'\n    autocmd ColorScheme * :hi! GitSignsDelete gui='NONE' guibg='NONE' guifg='" .. colors.neutral_red .. "'\n    autocmd ColorScheme * :hi! GitSignsChange gui='NONE' guibg='NONE' guifg='" .. colors.bright_blue .. "'\n    augroup END\n    "))