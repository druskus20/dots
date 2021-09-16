local _2afile_2a = "dots/plugins/lililine.fnl"
local _1_
do
  local name_4_auto = "dots.plugins.lililine"
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
    return {autoload("aniseed.core"), autoload("dots.colors"), autoload("lililine"), autoload("aniseed.nvim"), autoload("aniseed.string"), autoload("dots.utils")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {["require-macros"] = {macros = true}, autoload = {a = "aniseed.core", colors = "dots.colors", line = "lililine", nvim = "aniseed.nvim", str = "aniseed.string", utils = "dots.utils"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local colors = _local_4_[2]
local line = _local_4_[3]
local nvim = _local_4_[4]
local str = _local_4_[5]
local utils = _local_4_[6]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.plugins.lililine"
do local _ = ({nil, _1_, nil, {{nil}, nil, nil, nil}})[2] end
local function get_current_filename()
  return nvim.fn.expand("%:t")
end
local function get_current_filepath()
  local file = utils["shorten-path"](vim.fn.bufname(), 5, 50)
  if a["empty?"](file) then
    return ""
  elseif nvim.bo.readonly then
    return ("RO " .. file)
  elseif (nvim.bo.modifiable and nvim.bo.modified) then
    return (file .. " \239\129\128")
  else
    return file
  end
end
local function make_lsp_diagnostic_provider(kind)
  local function _9_()
    local n = vim.lsp.diagnostic.get_count(0, kind)
    if (n == 0) then
      return ""
    else
      return (" " .. n .. " ")
    end
  end
  return _9_
end
local bar_bg
do
  local v_23_auto
  do
    local v_25_auto = colors.dark0_soft
    _1_["bar-bg"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["bar-bg"] = v_23_auto
  bar_bg = v_23_auto
end
local modes
do
  local v_23_auto
  do
    local v_25_auto = {R = {color = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "REPLACE"}, Rv = {color = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "VIRTUAL"}, S = {color = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "SELECT"}, V = {color = {bg = colors.neutral_blue, fg = colors.dark0}, text = "VISUAL LINE"}, ["\22"] = {color = {bg = colors.neutral_blue, fg = colors.dark0}, text = "VISUAL BLOCK"}, ["r?"] = {color = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "CONFIRM"}, c = {color = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "CMMAND"}, ce = {color = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "NORMEX"}, cv = {color = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "EX"}, i = {color = {bg = colors.neutral_yellow, fg = colors.dark0}, text = "INSERT"}, ic = {color = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "INSCOMP"}, n = {color = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "NORMAL"}, no = {color = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "OP-PENDING"}, r = {color = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "HIT-ENTER"}, s = {color = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "SELECT"}, t = {color = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "TERM"}, v = {color = {bg = colors.neutral_blue, fg = colors.dark0}, text = "VISUAL"}}
    _1_["modes"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["modes"] = v_23_auto
  modes = v_23_auto
end
utils.highlight("StatusLine", {bg = bar_bg, fg = colors.light4})
utils.highlight("StatusLineFilePath", {bg = bar_bg, fg = colors.light4})
utils.highlight("StatusLineLspInfo", {bg = colors.neutral_blue, fg = bar_bg})
utils.highlight("StatusLineLspWarn", {bg = colors.neutal_yellow, fg = bar_bg})
utils.highlight("StatusLineLspError", {bg = colors.bright_red, fg = bar_bg})
local space
do
  local v_23_auto
  do
    local v_25_auto
    local function _11_()
      return " "
    end
    v_25_auto = {highlight = "StatusLineBase", provider = _11_}
    _1_["space"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["space"] = v_23_auto
  space = v_23_auto
end
local function _12_()
  local data = (modes[vim.fn.mode()] or {color = {bg = colors.neutral_orange, fg = colors.dark0}, text = vim.fn.mode()})
  return {color = data.color, text = (" " .. data.text .. " ")}
end
local function _13_()
  return vim.bo.filetype
end
local function _14_()
  local _let_15_ = vim.api.nvim_win_get_cursor(0)
  local line0 = _let_15_[1]
  local col = _let_15_[2]
  return (" " .. line0 .. ":" .. col .. " ")
end
line.lines.status = {{{highlight = "StatusLineMode", provider = _12_}, space, {highlight = "StatusLineFilePath", provider = get_current_filepath}}, {}, {{highlight = "StatusLine", provider = _13_}, {highlight = "StatusLineLspInfo", provider = make_lsp_diagnostic_provider("Info")}, {highlight = "StatusLineLspWarn", provider = make_lsp_diagnostic_provider("Warning")}, {highlight = "StatusLineLspError", provider = make_lsp_diagnostic_provider("Error")}, {highlight = "StatusLineMode", provider = _14_}}}
return nil