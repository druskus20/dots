local _2afile_2a = "dots/plugins/bufferline.fnl"
local _1_
do
  local name_4_auto = "dots.plugins.bufferline"
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
    return {autoload("aniseed.core"), autoload("bufferline"), autoload("dots.colors"), autoload("aniseed.nvim"), autoload("dots.utils")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {a = "aniseed.core", bufferline = "bufferline", colors = "dots.colors", nvim = "aniseed.nvim", utils = "dots.utils"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local bufferline = _local_4_[2]
local colors = _local_4_[3]
local nvim = _local_4_[4]
local utils = _local_4_[5]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.plugins.bufferline"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
do
  local selected = {gui = "", guibg = colors.neutral_aqua, guifg = colors.dark0}
  local visible = {gui = "", guibg = colors.dark1, guifg = colors.neutral_aqua}
  local function _8_(cnt, lvl, diagnostics_dict)
    return (" (" .. cnt .. ")")
  end
  bufferline.setup({highlights = {background = visible, buffer_selected = selected, buffer_visible = visible, diagnostic = {gui = "", guibg = colors.dark1, guifg = colors.neutral_red}, diagnostic_selected = {gui = "", guibg = colors.neutral_aqua, guifg = colors.faded_red}, diagnostic_visible = {gui = "", guibg = colors.dark1, guifg = colors.neutral_red}, duplicate = visible, duplicate_selected = selected, duplicate_visible = visible, error = visible, error_diagnostic = {gui = "", guibg = colors.dark1, guifg = colors.neutral_red}, error_diagnostic_selected = {gui = "", guibg = colors.neutral_aqua, guifg = colors.red}, error_diagnostic_visible = {gui = "", guibg = colors.dark1, guifg = colors.neutral_red}, error_selected = selected, error_visible = selected, fill = {guibg = colors.dark0, guifg = colors.light0}, indicator_selected = {guibg = colors.neutral_aqua, guifg = colors.neutral_aqua}, info_diagnostic = {gui = "", guibg = colors.dark1, guifg = colors.neutral_blue}, info_diagnostic_selected = {gui = "", guibg = colors.neutral_aqua, guifg = colors.faded_blue}, info_diagnostic_visible = {gui = "", guibg = colors.dark1, guifg = colors.neutral_blue}, modified = visible, modified_selected = selected, modified_visible = visible, pick_selected = {guibg = colors.bright_red, guifg = colors.bright_red}, separator = visible, tab = {guibg = colors.bright_yellow, guifg = colors.bright_yellow}, tab_selected = {guibg = colors.bright_green, guifg = colors.bright_green}, warning = visible, warning_diagnostic = {gui = "", guibg = colors.dark1, guifg = colors.neutral_yellow}, warning_diagnostic_selected = {gui = "", guibg = colors.neutral_aqua, guifg = colors.faded_yellow}, warning_diagnostic_visible = {gui = "", guibg = colors.dark1, guifg = colors.neutral_yellow}, warning_selected = selected, warning_visible = visible}, options = {diagnostics = "nvim_lsp", diagnostics_indicator = _8_, enforce_regular_tabs = false, show_buffer_close_icons = false, show_buffer_icons = false, show_close_icon = false, show_tab_indicators = false, tab_size = 10}})
end
return utils.highlight("BufferLineInfoSelected", {bg = colors.neutral_aqua, fg = colors.dark0, gui = "NONE"})