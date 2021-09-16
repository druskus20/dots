local _2afile_2a = "dots/plugins/compe.fnl"
local _1_
do
  local name_4_auto = "dots.plugins.compe"
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
    return {autoload("compe"), autoload("dots.utils"), (_1_)["aniseed/locals"]["result-formatter"]}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {compe = "compe", utils = "dots.utils"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local compe = _local_4_[1]
local utils = _local_4_[2]
local result_formatter = _local_4_[3]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.plugins.compe"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
utils.keymap("i", "<C-Space>", "compe#complete()", {expr = true})
local result_formatter0
do
  local v_23_auto
  do
    local v_25_auto
    local function result_formatter1(items)
      local max_width = 0
      for _, item in ipairs(items) do
        item.abbr = string.gsub(string.gsub(item.abbr, "~$", ""), " %(.*%)$", "")
        max_width = math.max(max_width, vim.fn.strwidth(item.abbr))
      end
      for _, item in ipairs(items) do
        local padding = string.rep(" ", (max_width - vim.fn.strwidth(item.abbr)))
        local details
        do
          local t_8_ = item
          if (nil ~= t_8_) then
            t_8_ = (t_8_).user_data
          end
          if (nil ~= t_8_) then
            t_8_ = (t_8_).compe
          end
          if (nil ~= t_8_) then
            t_8_ = (t_8_).completion_item
          end
          if (nil ~= t_8_) then
            t_8_ = (t_8_).detail
          end
          details = t_8_
        end
        if details then
          item.abbr = (item.abbr .. padding .. " " .. details)
        end
      end
      return items
    end
    v_25_auto = result_formatter1
    _1_["result-formatter"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["result-formatter"] = v_23_auto
  result_formatter0 = v_23_auto
end
return compe.setup({autocomplete = true, debug = false, documentation = true, enabled = true, formatting_functions = {nvim_lsp = {results = result_formatter0}}, incomplete_delay = 400, max_abbr_width = 100, max_kind_width = 100, max_menu_width = 100, min_length = 1, preselect = "enable", source = {buffer = true, calc = true, conjure = true, emoji = false, nvim_lsp = true, nvim_lua = true, path = true, vsnip = false}, source_timeout = 200, throttle_time = 80})