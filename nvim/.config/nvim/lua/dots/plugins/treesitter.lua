local _2afile_2a = "dots/plugins/treesitter.fnl"
local _1_
do
  local name_4_auto = "dots.plugins.treesitter"
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
    return {autoload("aniseed.core"), autoload("dots.utils"), require("nvim-treesitter.configs")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {["require-macros"] = {macros = true}, autoload = {a = "aniseed.core", utils = "dots.utils"}, require = {configs = "nvim-treesitter.configs"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local utils = _local_4_[2]
local configs = _local_4_[3]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.plugins.treesitter"
do local _ = ({nil, _1_, nil, {{nil}, nil, nil, nil}})[2] end
return configs.setup({context_commentstring = {disable = {"rust"}, enable = true}, ensure_installed = "all", highlight = {disable = {"fennel", "rust"}, enable = true}, incremental_selection = {enable = false, keymaps = {init_selection = "gss", node_decremental = "gsh", node_incremental = "gsl", scope_decremental = "gsk", scope_incremental = "gsj"}}, playground = {disable = {}, enable = true, keybindings = {focus_language = "f", goto_node = "<cr>", show_help = "?", toggle_anonymous_nodes = "a", toggle_hl_groups = "i", toggle_injected_languages = "t", toggle_language_display = "I", toggle_query_editor = "o", unfocus_language = "F", update = "R"}, persist_queries = false, updatetime = 25}})