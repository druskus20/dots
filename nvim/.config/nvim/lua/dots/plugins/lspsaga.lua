local _2afile_2a = "dots/plugins/lspsaga.fnl"
local _1_
do
  local name_4_auto = "dots.plugins.lspsaga"
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
    return {autoload("dots.colors"), autoload("dots.utils"), require("lspsaga")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {colors = "dots.colors", utils = "dots.utils"}, require = {saga = "lspsaga"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local colors = _local_4_[1]
local utils = _local_4_[2]
local saga = _local_4_[3]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.plugins.lspsaga"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
saga.init_lsp_saga({border_style = "single", code_action_keys = {exec = "<CR>", quit = "<esc>"}, code_action_prompt = {enable = true, sign = false, virtual_text = false}, finder_action_keys = {open = "<CR>", quit = "<esc>", scroll_down = "<C-d>", scroll_up = "<C-u>", split = "b", vsplit = "v"}, rename_action_keys = {exec = "<CR>", quit = "<esc>"}})
utils.highlight({"LspFloatWinBorder", "LspSagaHoverBorder", "LspSagaRenameBorder", "LspSagaSignatureHelpBorder", "LspSagaCodeActionBorder", "LspSagaDefPreviewBorder", "LspSagaDiagnosticBorder"}, {bg = colors.dark0_hard, fg = colors.dark0_hard})
utils.highlight({"LspSagaDiagnosticTruncateLine", "LspSagaDocTruncateLine", "LspSagaShTruncateLine"}, {bg = "NONE", fg = colors.dark0})
utils.highlight({"TargetWord", "LspSagaCodeActionTitle", "LspSagaBorderTitle", "LspSagaCodeActionContent", "LspSagaFinderSelection", "LspSagaDiagnosticHeader"}, {fg = colors.bright_aqua})
utils.highlight("LspFloatWinNormal", {bg = colors.dark0_hard})
utils.highlight("LspFloatWinBorder", {bg = colors.dark0_hard, fg = colors.dark0_hard})
return utils.highlight("TargetWord", {fg = colors.bright_aqua})