local _2afile_2a = "dots/plugins/trouble.fnl"
local _1_
do
  local name_4_auto = "dots.plugins.trouble"
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
    return {autoload("dots.colors"), autoload("dots.utils"), require("trouble")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {colors = "dots.colors", utils = "dots.utils"}, require = {trouble = "trouble"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local colors = _local_4_[1]
local utils = _local_4_[2]
local trouble = _local_4_[3]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.plugins.trouble"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
trouble.setup({action_keys = {cancel = "q", close = "<esc>", hover = {"a", "K"}, jump = "o", jump_close = "<CR>"}, auto_close = true, auto_open = false, auto_preview = true, icons = false})
utils.highlight("LspTroubleFoldIcon", {bg = "NONE", fg = colors.bright_orange})
utils.highlight("LspTroubleCount", {bg = "NONE", fg = colors.bright_green})
utils.highlight("LspTroubleText", {bg = "NONE", fg = colors.light0})
utils.highlight("LspTroubleSignError", {bg = "NONE", fg = colors.bright_red})
utils.highlight("LspTroubleSignWarning", {bg = "NONE", fg = colors.bright_yellow})
utils.highlight("LspTroubleSignInformation", {bg = "NONE", fg = colors.bright_aqua})
return utils.highlight("LspTroubleSignHint", {bg = "NONE", fg = colors.bright_blue})