local _2afile_2a = "dots/plugins/diffview.fnl"
local _1_
do
  local name_4_auto = "dots.plugins.diffview"
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
    return {autoload("diffview.config"), autoload("diffview")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {cb = "diffview.config", diffview = "diffview"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local cb = _local_4_[1]
local diffview = _local_4_[2]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.plugins.diffview"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
return diffview.setup({diff_binaries = false, file_panel = {use_icons = false, width = 35}, key_bindings = {view = {["<leader>dd"] = cb.diffview_callback("toggle_files"), ["<leader>dn"] = cb.diffview_callback("select_next_entry"), ["<leader>dp"] = cb.diffview_callback("select_prev_entry")}}})