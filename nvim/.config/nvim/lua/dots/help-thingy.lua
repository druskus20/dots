local _2afile_2a = "dots/help-thingy.fnl"
local _1_
do
  local name_4_auto = "dots.help-thingy"
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
    return {autoload("aniseed.core"), autoload("popup"), autoload("aniseed.string"), autoload("nvim-treesitter"), autoload("dots.utils")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {["require-macros"] = {macros = true}, autoload = {a = "aniseed.core", popup = "popup", str = "aniseed.string", ts = "nvim-treesitter", utils = "dots.utils"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local popup = _local_4_[2]
local str = _local_4_[3]
local ts = _local_4_[4]
local utils = _local_4_[5]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.help-thingy"
do local _ = ({nil, _1_, nil, {{nil}, nil, nil, nil}})[2] end
local pop
do
  local v_23_auto
  do
    local v_25_auto
    local function pop0(text, ft)
      local width = 20
      for _, line in ipairs(text) do
        width = math.max(width, #line)
      end
      local bufnr = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_buf_set_option(bufnr, "bufhidden", "wipe")
      vim.api.nvim_buf_set_option(bufnr, "filetype", ft)
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, text)
      return popup.create(bufnr, {padding = {1, 1, 1, 1}, width = width})
    end
    v_25_auto = pop0
    _1_["pop"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["pop"] = v_23_auto
  pop = v_23_auto
end
local get_current_word
do
  local v_23_auto
  do
    local v_25_auto
    local function get_current_word0()
      local col = (vim.api.nvim_win_get_cursor(0))[2]
      local line = vim.api.nvim_get_current_line()
      return (vim.fn.matchstr(line:sub(1, (col + 1)), "\\k*$") .. string.sub(vim.fn.matchstr(line:sub((col + 1)), "^\\k*"), 2))
    end
    v_25_auto = get_current_word0
    _1_["get-current-word"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["get-current-word"] = v_23_auto
  get_current_word = v_23_auto
end
local helpfiles_path
do
  local v_23_auto
  do
    local v_25_auto = str.join("/", a.butlast(str.split(vim.o.helpfile, "/")))
    do end (_1_)["helpfiles-path"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["helpfiles-path"] = v_23_auto
  helpfiles_path = v_23_auto
end
local tags
do
  local v_23_auto
  do
    local v_25_auto
    local entries = {}
    v_25_auto = nil
    _1_["tags"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["tags"] = v_23_auto
  tags = v_23_auto
end
local find_help_tag_for
do
  local v_23_auto
  do
    local v_25_auto
    local function find_help_tag_for0(topic)
      return (tags[topic] or tags[(topic .. "()")] or tags[(string.gsub(topic, "vim%.api%.", "") .. "()")] or tags[(string.gsub(topic, "vim%.fn%.", "") .. "()")] or tags[(string.gsub(topic, "fn%.", "") .. "()")] or tags[(string.gsub(topic, "vim%.o%.", "") .. "()")] or tags[(string.gsub(topic, "vim%.b%.", "") .. "()")] or tags[(string.gsub(topic, "vim%.g%.", "") .. "()")])
    end
    v_25_auto = find_help_tag_for0
    _1_["find-help-tag-for"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["find-help-tag-for"] = v_23_auto
  find_help_tag_for = v_23_auto
end
local help_for_tag
do
  local v_23_auto
  do
    local v_25_auto
    local function help_for_tag0(tag)
      local data = nil
      for line, _ in io.lines(tag.file) do
        if (nil == data) then
          if (-1 ~= vim.fn.match(line, (tag.address):sub(2))) then
            data = {line}
          end
        else
          if ((2 > #data) or ("" == line) or (" " == line:sub(1, 1)) or ("\9" == line:sub(1, 1)) or ("<" == line:sub(1, 1))) then
            table.insert(data, line)
          else
            return data
          end
        end
      end
      return nil
    end
    v_25_auto = help_for_tag0
    _1_["help-for-tag"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["help-for-tag"] = v_23_auto
  help_for_tag = v_23_auto
end
_G.get_help = function()
  local help_tag = find_help_tag_for(get_current_word())
  if help_tag then
    return pop(help_for_tag(help_tag), "help")
  end
end
return utils.keymap("n", "ML", ":call v:lua.get_help()<CR>")