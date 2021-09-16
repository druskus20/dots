local _2afile_2a = "dots/colors.fnl"
local _1_
do
  local name_4_auto = "dots.colors"
  local module_5_auto
  do
    local x_6_auto = _G.package.loaded[name_4_auto]
    if ("table" == type(x_6_auto)) then
      module_5_auto = x_6_auto
    else
      module_5_auto = {bright_aqua = "#ddfcf8", bright_blue = "#c9e6fd", bright_green = "#eff6ab", bright_orange = "#ffd3c2", bright_purple = "#f7d7ff", bright_red = "#ffc4c4", bright_yellow = "#ffe6b5", dark0 = "#2e3440", dark0_hard = "#292f3a", dark0_soft = "#343346", dark1 = "#3e3d50", dark2 = "#494859", dark3 = "#545363", dark4 = "#5f5e6d", faded_aqua = "#abebe2", faded_blue = "#8abae1", faded_green = "#c9d36a", faded_orange = "#E69E83", faded_purple = "#db9fe9", faded_red = "#ec8989", faded_yellow = "#ceb581", gray = "#c5c8c6", light0 = "#dfdfe2", light0_hard = "#eaeaec", light0_soft = "#d4d4d8", light1 = "#cac9ce", light2 = "#b4b4bb", light3 = "#a9a9b1", light4 = "#696977", neutral_aqua = "#c7ebe6", neutral_blue = "#a5c6e1", neutral_green = "#ccd389", neutral_orange = "#efb6a0", neutral_purple = "#e1bee9", neutral_red = "#eca8a8", neutral_yellow = "#efd5a0"}
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
    _1_["aniseed/local-fns"] = {}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.colors"
return ({nil, _1_, nil, {{}, nil, nil, nil}})[2]