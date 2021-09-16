local _2afile_2a = "dots/smart-compe-conjure.fnl"
local _1_
do
  local name_4_auto = "dots.smart-compe-conjure"
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
    return {autoload("aniseed.core"), autoload("compe"), autoload("dots.help-thingy"), autoload("popup"), autoload("aniseed.string"), autoload("dots.utils"), autoload("aniseed.view")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {["require-macros"] = {macros = true}, autoload = {a = "aniseed.core", compe = "compe", help = "dots.help-thingy", popup = "popup", str = "aniseed.string", utils = "dots.utils", view = "aniseed.view"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local compe = _local_4_[2]
local help = _local_4_[3]
local popup = _local_4_[4]
local str = _local_4_[5]
local utils = _local_4_[6]
local view = _local_4_[7]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.smart-compe-conjure"
do local _ = ({nil, _1_, nil, {{nil}, nil, nil, nil}})[2] end
local fuck
do
  local v_23_auto
  do
    local v_25_auto = require("compe_conjure")
    do end (_1_)["fuck"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["fuck"] = v_23_auto
  fuck = v_23_auto
end
local my_source
do
  local v_23_auto
  do
    local v_25_auto = {}
    _1_["my_source"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["my_source"] = v_23_auto
  my_source = v_23_auto
end
local function _8_()
  return setmetatable({}, {__index = my_source})
end
my_source.new = _8_
my_source.determine = fuck.determine
my_source.get_metadata = fuck.get_metadata
my_source.complete = fuck.complete
my_source.abort = fuck.abort
local function _9_(self, args)
  a.println(view.serialise(args))
  local function _10_()
    local help_tag = help["find-help-tag-for"](args.completed_item.word)
    if help_tag then
      local lines = {"```help"}
      for _, line in ipairs(help["help-for-tag"](help_tag)) do
        table.insert(lines, line)
      end
      table.insert(lines, "```")
      return lines
    end
  end
  return args.callback(_10_())
end
my_source.documentation = _9_
compe.register_source("epic", my_source.new())
return compe.setup({autocomplete = false, debug = false, documentation = true, enabled = true, incomplete_delay = 400, max_abbr_width = 100, max_kind_width = 100, max_menu_width = 100, min_length = 1, preselect = "enable", source = {buffer = true, calc = true, epic = true, nvim_lsp = true, nvim_lua = true, path = true, vsnip = false}, source_timeout = 200, throttle_time = 80})