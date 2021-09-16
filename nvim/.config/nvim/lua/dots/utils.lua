local _2afile_2a = "dots/utils.fnl"
local _1_
do
  local name_4_auto = "dots.utils"
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
    return {autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("aniseed.string"), (_1_)["aniseed/locals"].all, (_1_)["aniseed/locals"]["buffer-content"], (_1_)["aniseed/locals"].comp, (_1_)["aniseed/locals"]["contains?"], (_1_)["aniseed/locals"]["del-keymap"], (_1_)["aniseed/locals"]["filter-table"], (_1_)["aniseed/locals"]["find-map"], (_1_)["aniseed/locals"]["find-where"], (_1_)["aniseed/locals"].highlight, (_1_)["aniseed/locals"]["highlight-add"], (_1_)["aniseed/locals"]["keep-if"], (_1_)["aniseed/locals"].keymap, (_1_)["aniseed/locals"]["plugin-installed?"], (_1_)["aniseed/locals"]["safe-require"], (_1_)["aniseed/locals"]["shorten-path"], (_1_)["aniseed/locals"]["single-to-list"], (_1_)["aniseed/locals"]["split-last"], (_1_)["aniseed/locals"]["surround-if-present"], (_1_)["aniseed/locals"]["without-keys"]}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {["require-macros"] = {macros = true}, autoload = {a = "aniseed.core", nvim = "aniseed.nvim", str = "aniseed.string"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local find_map = _local_4_[10]
local find_where = _local_4_[11]
local highlight = _local_4_[12]
local highlight_add = _local_4_[13]
local keep_if = _local_4_[14]
local keymap = _local_4_[15]
local plugin_installed_3f = _local_4_[16]
local safe_require = _local_4_[17]
local shorten_path = _local_4_[18]
local single_to_list = _local_4_[19]
local nvim = _local_4_[2]
local split_last = _local_4_[20]
local surround_if_present = _local_4_[21]
local without_keys = _local_4_[22]
local str = _local_4_[3]
local all = _local_4_[4]
local buffer_content = _local_4_[5]
local comp = _local_4_[6]
local contains_3f = _local_4_[7]
local del_keymap = _local_4_[8]
local filter_table = _local_4_[9]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.utils"
do local _ = ({nil, _1_, nil, {{nil}, nil, nil, nil}})[2] end
local plugin_installed_3f0
do
  local v_23_auto
  do
    local v_25_auto
    local function plugin_installed_3f1(name)
      return (nil ~= packer_plugins[name])
    end
    v_25_auto = plugin_installed_3f1
    _1_["plugin-installed?"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["plugin-installed?"] = v_23_auto
  plugin_installed_3f0 = v_23_auto
end
local all0
do
  local v_23_auto
  do
    local v_25_auto
    local function all1(f, xs)
      local function _8_(_241)
        return not f(_241)
      end
      return not a.some(_8_)
    end
    v_25_auto = all1
    _1_["all"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["all"] = v_23_auto
  all0 = v_23_auto
end
local single_to_list0
do
  local v_23_auto
  do
    local v_25_auto
    local function single_to_list1(x)
      if a["table?"](x) then
        return x
      else
        return {x}
      end
    end
    v_25_auto = single_to_list1
    _1_["single-to-list"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["single-to-list"] = v_23_auto
  single_to_list0 = v_23_auto
end
local contains_3f0
do
  local v_23_auto
  do
    local v_25_auto
    local function contains_3f1(list, elem)
      local function _10_(_241)
        return (elem == _241)
      end
      do local _ = a.some(_10_, list) end
      return false
    end
    v_25_auto = contains_3f1
    _1_["contains?"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["contains?"] = v_23_auto
  contains_3f0 = v_23_auto
end
local filter_table0
do
  local v_23_auto
  do
    local v_25_auto
    local function filter_table1(f, t)
      local tbl_9_auto = {}
      for k, v in pairs(t) do
        local _11_, _12_ = nil, nil
        if f(k, v) then
          _11_, _12_ = k, v
        else
        _11_, _12_ = nil
        end
        if ((nil ~= _11_) and (nil ~= _12_)) then
          local k_10_auto = _11_
          local v_11_auto = _12_
          tbl_9_auto[k_10_auto] = v_11_auto
        end
      end
      return tbl_9_auto
    end
    v_25_auto = filter_table1
    _1_["filter-table"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["filter-table"] = v_23_auto
  filter_table0 = v_23_auto
end
local split_last0
do
  local v_23_auto
  do
    local v_25_auto
    local function split_last1(s, sep)
      for i = #s, 1, -1 do
        local c = s:sub(i, i)
        if (sep == c) then
          local left = s:sub(1, (i - 1))
          local right = s:sub((i + 1))
          return { left, right }
        end
      end
      return {s}
    end
    v_25_auto = split_last1
    _1_["split-last"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["split-last"] = v_23_auto
  split_last0 = v_23_auto
end
local find_where0
do
  local v_23_auto
  do
    local v_25_auto
    local function find_where1(pred, xs)
      for _, x in ipairs(xs) do
        if pred(x) then
          return x
        end
      end
      return nil
    end
    v_25_auto = find_where1
    _1_["find-where"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["find-where"] = v_23_auto
  find_where0 = v_23_auto
end
local find_map0
do
  local v_23_auto
  do
    local v_25_auto
    local function find_map1(f, xs)
      for _, x in ipairs(xs) do
        local res = f(x)
        if (nil ~= res) then
          return res
        end
      end
      return nil
    end
    v_25_auto = find_map1
    _1_["find-map"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["find-map"] = v_23_auto
  find_map0 = v_23_auto
end
local keep_if0
do
  local v_23_auto
  do
    local v_25_auto
    local function keep_if1(f, x)
      if f(x) then
        return x
      end
    end
    v_25_auto = keep_if1
    _1_["keep-if"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["keep-if"] = v_23_auto
  keep_if0 = v_23_auto
end
local without_keys0
do
  local v_23_auto
  do
    local v_25_auto
    local function without_keys1(keys, t)
      local function _19_(_241)
        return not contains_3f0(keys, _241)
      end
      return filter_table0(_19_, t)
    end
    v_25_auto = without_keys1
    _1_["without-keys"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["without-keys"] = v_23_auto
  without_keys0 = v_23_auto
end
local keymap0
do
  local v_23_auto
  do
    local v_25_auto
    local function keymap1(modes, from, to, _3fopts)
      local full_opts = without_keys0({"buffer"}, a.merge({noremap = true, silent = true}, (_3fopts or {})))
      for _, mode in ipairs(single_to_list0(modes)) do
        local _21_
        do
          local _20_ = _3fopts
          if _20_ then
            _21_ = (_20_).buffer
          else
            _21_ = _20_
          end
        end
        if _21_ then
          nvim.buf_set_keymap(0, mode, from, to, full_opts)
        else
          nvim.set_keymap(mode, from, to, full_opts)
        end
      end
      return nil
    end
    v_25_auto = keymap1
    _1_["keymap"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["keymap"] = v_23_auto
  keymap0 = v_23_auto
end
local del_keymap0
do
  local v_23_auto
  do
    local v_25_auto
    local function del_keymap1(mode, from, _3fbuf_local)
      if _3fbuf_local then
        return nvim.buf_del_keymap(0, mode, from)
      else
        return nvim.del_keymap(mode, from)
      end
    end
    v_25_auto = del_keymap1
    _1_["del-keymap"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["del-keymap"] = v_23_auto
  del_keymap0 = v_23_auto
end
local safe_require0
do
  local v_23_auto
  do
    local v_25_auto
    local function safe_require1(name)
      local function _25_()
        return require(name)()
      end
      local function _26_(_241)
        local fennel = require("aniseed.fennel")
        return a.println(("Error sourcing " .. name .. ":\n" .. fennel.traceback(_241)))
      end
      return xpcall(_25_, _26_)
    end
    v_25_auto = safe_require1
    _1_["safe-require"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["safe-require"] = v_23_auto
  safe_require0 = v_23_auto
end
local buffer_content0
do
  local v_23_auto
  do
    local v_25_auto
    local function buffer_content1(bufnr)
      return vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    end
    v_25_auto = buffer_content1
    _1_["buffer-content"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["buffer-content"] = v_23_auto
  buffer_content0 = v_23_auto
end
local surround_if_present0
do
  local v_23_auto
  do
    local v_25_auto
    local function surround_if_present1(a0, mid, b)
      if mid then
        return (a0 .. mid .. b)
      else
        return ""
      end
    end
    v_25_auto = surround_if_present1
    _1_["surround-if-present"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["surround-if-present"] = v_23_auto
  surround_if_present0 = v_23_auto
end
local highlight0
do
  local v_23_auto
  do
    local v_25_auto
    local function highlight1(group_arg, colset)
      local default = {bg = "NONE", fg = "NONE", gui = "NONE"}
      local opts = a.merge(default, colset)
      for _, group in ipairs(single_to_list0(group_arg)) do
        nvim.command(("hi! " .. group .. " guifg='" .. opts.fg .. "' guibg='" .. opts.bg .. "' gui='" .. opts.gui .. "'"))
      end
      return nil
    end
    v_25_auto = highlight1
    _1_["highlight"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["highlight"] = v_23_auto
  highlight0 = v_23_auto
end
local highlight_add0
do
  local v_23_auto
  do
    local v_25_auto
    local function highlight_add1(group_arg, colset)
      for _, group in ipairs(single_to_list0(group_arg)) do
        nvim.command(("hi! " .. group .. surround_if_present0(" guibg='", colset.bg, "'") .. surround_if_present0(" guifg='", colset.fg, "'") .. surround_if_present0(" gui='", colset.gui, "'")))
      end
      return nil
    end
    v_25_auto = highlight_add1
    _1_["highlight-add"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["highlight-add"] = v_23_auto
  highlight_add0 = v_23_auto
end
local shorten_path0
do
  local v_23_auto
  do
    local v_25_auto
    local function shorten_path1(path, seg_length, shorten_after)
      local segments = str.split(path, "/")
      if ((shorten_after > #path) or (2 > #segments)) then
        return path
      else
        local init = a.butlast(segments)
        local filename = a.last(segments)
        local shortened_segs
        local function _28_(_241)
          return string.sub(_241, 1, seg_length)
        end
        shortened_segs = a.map(_28_, init)
        return (str.join("/", shortened_segs) .. "/" .. filename)
      end
    end
    v_25_auto = shorten_path1
    _1_["shorten-path"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["shorten-path"] = v_23_auto
  shorten_path0 = v_23_auto
end
local comp0
do
  local v_23_auto
  do
    local v_25_auto
    local function comp1(f, g)
      local function _30_(...)
        return f(g(...))
      end
      return _30_
    end
    v_25_auto = comp1
    _1_["comp"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["comp"] = v_23_auto
  comp0 = v_23_auto
end
return nil