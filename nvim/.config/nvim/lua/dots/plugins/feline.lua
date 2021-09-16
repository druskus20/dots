local _2afile_2a = "dots/plugins/feline.fnl"
local _1_
do
  local name_4_auto = "dots.plugins.feline"
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
    return {autoload("aniseed.core"), autoload("dots.colors"), autoload("feline"), autoload("feline.providers.git"), autoload("feline.providers.lsp"), autoload("aniseed.nvim"), autoload("aniseed.string"), autoload("dots.utils"), autoload("aniseed.view"), (_1_)["aniseed/locals"]["bar-bg"], (_1_)["aniseed/locals"].components, (_1_)["aniseed/locals"]["get-current-filepath"], (_1_)["aniseed/locals"]["git-status-provider"], (_1_)["aniseed/locals"]["lsp-diagnostic-component"], (_1_)["aniseed/locals"]["lsp-progress-provider"], (_1_)["aniseed/locals"]["or-empty"], (_1_)["aniseed/locals"].spaces, (_1_)["aniseed/locals"]["vim-mode-hl"]}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {["require-macros"] = {macros = true}, autoload = {["feline-git"] = "feline.providers.git", ["feline-lsp"] = "feline.providers.lsp", a = "aniseed.core", colors = "dots.colors", feline = "feline", nvim = "aniseed.nvim", str = "aniseed.string", utils = "dots.utils", view = "aniseed.view"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local bar_bg = _local_4_[10]
local components = _local_4_[11]
local get_current_filepath = _local_4_[12]
local git_status_provider = _local_4_[13]
local lsp_diagnostic_component = _local_4_[14]
local lsp_progress_provider = _local_4_[15]
local or_empty = _local_4_[16]
local spaces = _local_4_[17]
local vim_mode_hl = _local_4_[18]
local colors = _local_4_[2]
local feline = _local_4_[3]
local feline_git = _local_4_[4]
local feline_lsp = _local_4_[5]
local nvim = _local_4_[6]
local str = _local_4_[7]
local utils = _local_4_[8]
local view = _local_4_[9]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.plugins.feline"
do local _ = ({nil, _1_, nil, {{nil}, nil, nil, nil}})[2] end
local modes = {R = {color = colors.neutral_aqua, text = "REPLACE"}, Rv = {color = colors.neutral_aqua, text = "VIRTUAL"}, S = {color = colors.neutral_aqua, text = "SELECT"}, V = {color = colors.neutral_blue, text = "VISUAL LINE"}, ["\22"] = {color = colors.neutral_blue, text = "VISUAL BLOCK"}, ["r?"] = {color = colors.neutral_aqua, text = "CONFIRM"}, c = {color = colors.neutral_aqua, text = "CMMAND"}, ce = {color = colors.neutral_aqua, text = "NORMEX"}, cv = {color = colors.neutral_aqua, text = "EX"}, i = {color = colors.neutral_yellow, text = "INSERT"}, ic = {color = colors.neutral_aqua, text = "INSCOMP"}, n = {color = colors.neutral_aqua, text = "NORMAL"}, no = {color = colors.neutral_aqua, text = "OP-PENDING"}, r = {color = colors.neutral_aqua, text = "HIT-ENTER"}, s = {color = colors.neutral_aqua, text = "SELECT"}, t = {color = colors.neutral_aqua, text = "TERM"}, v = {color = colors.neutral_blue, text = "VISUAL"}}
local bar_bg0
do
  local v_23_auto
  do
    local v_25_auto = colors.dark0
    _1_["bar-bg"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["bar-bg"] = v_23_auto
  bar_bg0 = v_23_auto
end
local or_empty0
do
  local v_23_auto
  do
    local v_25_auto
    local function or_empty1(x)
      return (x or "")
    end
    v_25_auto = or_empty1
    _1_["or-empty"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["or-empty"] = v_23_auto
  or_empty0 = v_23_auto
end
local spaces0
do
  local v_23_auto
  do
    local v_25_auto
    local function spaces1(x)
      if x then
        return (" " .. x .. " ")
      else
        return ""
      end
    end
    v_25_auto = spaces1
    _1_["spaces"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["spaces"] = v_23_auto
  spaces0 = v_23_auto
end
local get_current_filepath0
do
  local v_23_auto
  do
    local v_25_auto
    local function get_current_filepath1()
      local file = utils["shorten-path"](vim.fn.bufname(), 5, 50)
      if a["empty?"](file) then
        return ""
      elseif nvim.bo.readonly then
        return ("RO " .. file)
      elseif (nvim.bo.modifiable and nvim.bo.modified) then
        return (file .. "\226\151\143")
      else
        return (file .. " ")
      end
    end
    v_25_auto = get_current_filepath1
    _1_["get-current-filepath"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["get-current-filepath"] = v_23_auto
  get_current_filepath0 = v_23_auto
end
local lsp_diagnostic_component0
do
  local v_23_auto
  do
    local v_25_auto
    local function lsp_diagnostic_component1(kind, color)
      local function _10_()
        return (0 ~= vim.lsp.diagnostic.get_count(0, kind))
      end
      local function _11_()
        return spaces0(vim.lsp.diagnostic.get_count(0, kind))
      end
      return {enabled = _10_, hl = {bg = color, fg = bar_bg0}, left_sep = "", provider = _11_, right_sep = ""}
    end
    v_25_auto = lsp_diagnostic_component1
    _1_["lsp-diagnostic-component"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["lsp-diagnostic-component"] = v_23_auto
  lsp_diagnostic_component0 = v_23_auto
end
local vim_mode_hl0
do
  local v_23_auto
  do
    local v_25_auto
    local function vim_mode_hl1(use_as_fg_3f)
      local color = modes[vim.fn.mode()].color
      if use_as_fg_3f then
        return {bg = bar_bg0, fg = color}
      else
        return {bg = color, fg = bar_bg0}
      end
    end
    v_25_auto = vim_mode_hl1
    _1_["vim-mode-hl"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["vim-mode-hl"] = v_23_auto
  vim_mode_hl0 = v_23_auto
end
local git_status_provider0
do
  local v_23_auto
  do
    local v_25_auto
    local function git_status_provider1()
      local function _13_(_241)
        return ("master" ~= _241)
      end
      local function _15_()
        local t_14_ = vim.b
        if (nil ~= t_14_) then
          t_14_ = (t_14_).gitsigns_status_dict
        end
        if (nil ~= t_14_) then
          t_14_ = (t_14_).head
        end
        return t_14_
      end
      return or_empty0(utils["keep-if"](_13_, _15_()))
    end
    v_25_auto = git_status_provider1
    _1_["git-status-provider"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["git-status-provider"] = v_23_auto
  git_status_provider0 = v_23_auto
end
local lsp_progress_provider0
do
  local v_23_auto
  do
    local v_25_auto
    local function lsp_progress_provider1()
      local msgs = vim.lsp.util.get_progress_messages()
      local s
      do
        local tbl_12_auto = {}
        for _, msg in ipairs(msgs) do
          local _18_
          if msg.message then
            _18_ = (msg.title .. " " .. msg.message)
          else
          _18_ = nil
          end
          tbl_12_auto[(#tbl_12_auto + 1)] = _18_
        end
        s = tbl_12_auto
      end
      return or_empty0(str.join(" | ", s))
    end
    v_25_auto = lsp_progress_provider1
    _1_["lsp-progress-provider"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["lsp-progress-provider"] = v_23_auto
  lsp_progress_provider0 = v_23_auto
end
local components0
do
  local v_23_auto
  do
    local v_25_auto = {active = {}, inactive = {}}
    _1_["components"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["components"] = v_23_auto
  components0 = v_23_auto
end
local function _20_()
  return vim_mode_hl0(false)
end
local function _21_()
  return (" " .. (modes[vim.fn.mode()].text or vim.fn.mode) .. " ")
end
local function _22_()
  return vim_mode_hl0(true)
end
components0.active[1] = {{hl = _20_, provider = _21_}, {left_sep = " ", provider = get_current_filepath0}, {hl = _22_, left_sep = " ", provider = git_status_provider0}}
local function _23_()
  return (0 < #vim.lsp.buf_get_clients())
end
components0.active[2] = {{enabled = _23_, provider = lsp_progress_provider0}}
local function _24_()
  return vim_mode_hl0(true)
end
local function _25_()
  return vim.bo.filetype
end
local function _26_()
  return vim_mode_hl0(false)
end
local function _27_()
  local _let_28_ = vim.api.nvim_win_get_cursor(0)
  local line = _let_28_[1]
  local col = _let_28_[2]
  return (" " .. line .. ":" .. col .. " ")
end
components0.active[3] = {{hl = _24_, provider = _25_, right_sep = " "}, lsp_diagnostic_component0("Information", colors.neutral_purple), lsp_diagnostic_component0("Hint", colors.neutral_blue), lsp_diagnostic_component0("Warn", colors.neutal_yellow), lsp_diagnostic_component0("Error", colors.neutral_red), {hl = _26_, provider = _27_}}
return feline.setup({colors = {bg = bar_bg0, fg = colors.dark4}, components = components0})