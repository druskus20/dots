local _2afile_2a = "dots/plugins/galaxyline.fnl"
local _1_
do
  local name_4_auto = "dots.plugins.galaxyline"
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
    return {autoload("aniseed.core"), autoload("dots.colors"), autoload("galaxyline"), autoload("galaxyline.condition"), autoload("galaxyline.provider_diagnostic"), autoload("galaxyline.provider_fileinfo"), autoload("galaxyline.provider_vcs"), autoload("aniseed.nvim"), autoload("aniseed.string"), autoload("dots.utils")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {["require-macros"] = {macros = true}, autoload = {["gl-condition"] = "galaxyline.condition", ["gl-diagnostic"] = "galaxyline.provider_diagnostic", ["gl-fileinfo"] = "galaxyline.provider_fileinfo", ["gl-vcs"] = "galaxyline.provider_vcs", a = "aniseed.core", colors = "dots.colors", galaxyline = "galaxyline", nvim = "aniseed.nvim", str = "aniseed.string", utils = "dots.utils"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local utils = _local_4_[10]
local colors = _local_4_[2]
local galaxyline = _local_4_[3]
local gl_condition = _local_4_[4]
local gl_diagnostic = _local_4_[5]
local gl_fileinfo = _local_4_[6]
local gl_vcs = _local_4_[7]
local nvim = _local_4_[8]
local str = _local_4_[9]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.plugins.galaxyline"
do local _ = ({nil, _1_, nil, {{nil}, nil, nil, nil}})[2] end
local bar_bg_col
do
  local v_23_auto = colors.dark1
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["bar-bg-col"] = v_23_auto
  bar_bg_col = v_23_auto
end
local modes = {R = {colors = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "REPLACE"}, Rv = {colors = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "VIRTUAL"}, S = {colors = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "SELECT"}, V = {colors = {bg = colors.neutral_blue, fg = colors.dark0}, text = "VISUAL LINE"}, ["\22"] = {colors = {bg = colors.neutral_blue, fg = colors.dark0}, text = "VISUAL BLOCK"}, ["r?"] = {colors = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "CONFIRM"}, c = {colors = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "CMMAND"}, ce = {colors = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "NORMEX"}, cv = {colors = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "EX"}, i = {colors = {bg = colors.neutral_yellow, fg = colors.dark0}, text = "INSERT"}, ic = {colors = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "INSCOMP"}, n = {colors = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "NORMAL"}, no = {colors = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "OP-PENDING"}, r = {colors = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "HIT-ENTER"}, s = {colors = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "SELECT"}, t = {colors = {bg = colors.neutral_aqua, fg = colors.dark0}, text = "TERM"}, v = {colors = {bg = colors.neutral_blue, fg = colors.dark0}, text = "VISUAL"}}
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
galaxyline.short_line_list = {"dbui", "diff", "peekaboo", "undotree", "vista", "vista_markdown"}
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
local function _11_()
  local vim_mode = nvim.fn.mode()
  local modedata = (modes[vim_mode] or {colors = {bg = colors.neutral_orange, fg = colors.dark0}, text = vim_mode})
  utils.highlight("GalaxyViMode", modedata.colors)
  return ("  " .. modedata.text .. " ")
end
local function _12_()
  return ""
end
galaxyline.section.left = {{ViMode = {provider = _11_}}, {FileName = {highlight = {colors.light4, bar_bg_col}, provider = get_current_filepath}}, {Space = {highlight = {colors.light0, bar_bg_col}, provider = _12_}}}
local function _13_()
  local branch = gl_vcs.get_git_branch()
  if ("master" == branch) then
    return ""
  else
    return branch
  end
end
local function _15_()
  return nvim.bo.filetype
end
local function _16_()
  return (" " .. gl_fileinfo.line_column() .. " ")
end
galaxyline.section.right = {{GitBranch = {highlight = {colors.light4, bar_bg_col}, provider = _13_}}, {FileType = {highlight = {colors.neutral_aqua, bar_bg_col}, provider = _15_}}, {DiagnosticInfo = {highlight = {colors.dark1, colors.neutral_blue}, provider = make_lsp_diagnostic_provider("Info")}}, {DiagnosticWarn = {highlight = {colors.dark1, colors.neutral_yellow}, provider = make_lsp_diagnostic_provider("Warning"), separator = ""}}, {DiagnosticError = {highlight = {colors.dark1, colors.bright_red}, provider = make_lsp_diagnostic_provider("Error"), separator = ""}}, {LineInfo = {highlight = "GalaxyViMode", provider = _16_, separator = ""}}}
local function add_segment_defaults(data)
  return a.merge({highlight = {colors.light0, bar_bg_col}, separator = " ", separator_highlight = "StatusLine"}, data)
end
local function map_gl_section(f, section)
  local tbl_12_auto = {}
  for _, elem in ipairs(section) do
    local _17_
    do
      local tbl_9_auto = {}
      for k, v in pairs(elem) do
        local _18_, _19_ = k, f(v)
        if ((nil ~= _18_) and (nil ~= _19_)) then
          local k_10_auto = _18_
          local v_11_auto = _19_
          tbl_9_auto[k_10_auto] = v_11_auto
        end
      end
      _17_ = tbl_9_auto
    end
    tbl_12_auto[(#tbl_12_auto + 1)] = _17_
  end
  return tbl_12_auto
end
galaxyline.section.left = map_gl_section(add_segment_defaults, galaxyline.section.left)
galaxyline.section.right = map_gl_section(add_segment_defaults, galaxyline.section.right)
return nil