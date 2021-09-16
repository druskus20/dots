local _2afile_2a = "init.fnl"
local _1_
do
  local name_4_auto = "init"
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
    return {autoload("aniseed.core"), autoload("dots.colors"), autoload("aniseed.nvim"), autoload("aniseed.string"), autoload("dots.utils")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {["require-macros"] = {macros = true}, autoload = {a = "aniseed.core", colors = "dots.colors", nvim = "aniseed.nvim", str = "aniseed.string", utils = "dots.utils"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local colors = _local_4_[2]
local nvim = _local_4_[3]
local str = _local_4_[4]
local utils = _local_4_[5]
local _2amodule_2a = _1_
local _2amodule_name_2a = "init"
do local _ = ({nil, _1_, nil, {{nil}, nil, nil, nil}})[2] end
if vim.fn.has("termguicolors") then
  vim.o["termguicolors"] = true
end
local function _9_()
  return require("dots.plugins")
end
local function _10_(_241)
  local fennel_3_auto = require("aniseed.fennel")
  return a.println(fennel_3_auto.traceback(_241))
end
xpcall(_9_, _10_)
local function _11_()
  return require("dots.plugins.lsp")
end
local function _12_(_241)
  local fennel_3_auto = require("aniseed.fennel")
  return a.println(fennel_3_auto.traceback(_241))
end
xpcall(_11_, _12_)
local function _13_()
  return require("dots.keybinds")
end
local function _14_(_241)
  local fennel_3_auto = require("aniseed.fennel")
  return a.println(fennel_3_auto.traceback(_241))
end
xpcall(_13_, _14_)
vim.cmd("let mapleader=\"\\<Space>\"")
vim.cmd("let maplocalleader=\",\"")
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")
do end (vim.wo)["foldmethod"] = "marker"
vim.o["showmode"] = false
do
  vim.bo["undofile"] = true
  vim.o["undofile"] = true
end
vim.o["shortmess"] = (vim.o.shortmess .. "c")
do end (vim.o)["hidden"] = true
vim.o["encoding"] = "utf-8"
vim.wo["number"] = false
vim.wo["relativenumber"] = false
vim.o["compatible"] = false
vim.wo["cursorline"] = true
vim.o["incsearch"] = true
vim.o["hlsearch"] = true
vim.o["inccommand"] = "nosplit"
vim.wo["signcolumn"] = "yes"
do
  vim.bo["shiftwidth"] = 2
  vim.o["shiftwidth"] = 2
end
do
  vim.bo["tabstop"] = 2
  vim.o["tabstop"] = 2
end
vim.o["backspace"] = "indent,eol,start"
do
  vim.bo["autoindent"] = true
  vim.o["autoindent"] = true
end
do
  vim.bo["smartindent"] = true
  vim.o["smartindent"] = true
end
do
  vim.bo["expandtab"] = true
  vim.o["expandtab"] = true
end
vim.wo["wrap"] = false
vim.o["completeopt"] = "menuone,noselect"
vim.o["laststatus"] = 2
vim.o["splitbelow"] = true
vim.o["splitright"] = true
vim.o["mouse"] = "a"
vim.o["shell"] = "bash"
vim.o["background"] = "dark"
do
  vim.bo["swapfile"] = false
  vim.o["swapfile"] = false
end
do
  vim.bo["undolevels"] = 10000
  vim.o["undolevels"] = 10000
end
vim.cmd("let &t_ut=\"\"")
vim.cmd("autocmd! BufReadPost *.hs :set shiftwidth=2")
vim.cmd("autocmd! FileType vim setlocal foldmethod=marker")
vim.cmd("autocmd! FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
vim.cmd("autocmd! FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>")
vim.cmd("autocmd! TextYankPost * silent! lua vim.highlight.on_yank {higroup=\"IncSearch\", timeout=300}")
utils["highlight-add"]({"GruvboxBlueSign", "GruvboxAquaSign", "GruvboxRedSign", "GruvboxYellowSign", "GruvboxGreenSign", "GruvboxOrangeSign", "GruvboxPurpleSign"}, {bg = "NONE"})
utils.highlight("EndOfBuffer", {bg = "NONE", fg = colors.dark0})
utils.highlight("LineNr", {bg = "NONE"})
utils["highlight-add"]("Pmenu", {bg = colors.dark0_hard})
utils["highlight-add"]("PmenuSel", {bg = colors.bright_aqua})
utils["highlight-add"]("PmenuSbar", {bg = colors.dark0_hard})
utils["highlight-add"]("PmenuThumb", {bg = colors.dark1})
utils["highlight-add"]("NormalFloat", {bg = colors.dark0_hard})
utils["highlight-add"]("SignColumn", {bg = colors.dark0})
utils["highlight-add"]("FloatBorder", {bg = colors.dark0_hard})
utils.highlight({"StatusLine", "GalaxyLineInfo", "GalaxySpace"}, {bg = colors.dark1, fg = colors.light0})
vim.cmd("highlight link Function GruvboxGreen")
vim.g.VM_leader = "m"
vim.g.rust_clip_command = "xclip -selection clipboard"
vim.g.rustfmt_autosave = 1
vim.g["conjure#client#fennel#aniseed#aniseed_module_prefix"] = "aniseed."
vim.g.vim_parinfer_filetypes = {"carp", "fennel", "clojure"}
local remapped_space = nil
_G.RebindShit = function(newKey)
  remapped_space = {cur = newKey, old = vim.fn.maparg("<Space>", "i")}
  return utils.keymap("i", "<Space>", newKey, {buffer = true})
end
_G.UnbindSpaceStuff = function()
  if (remapped_space and (remapped_space ~= {})) then
    utils["del-keymap"]("i", "<Space>", true)
    if (remapped_space.old ~= "") then
      utils.keymap("i", "<Space>", remapped_space.old, {buffer = true})
    end
    remapped_space = nil
    return nil
  end
end
nvim.command("autocmd! InsertLeave * :call v:lua.UnbindSpaceStuff()")
utils.keymap("n", "<Tab>j", ":call v:lua.RebindShit('_')<CR>")
utils.keymap("n", "<Tab>k", ":call v:lua.RebindShit('::')<CR>")
utils.keymap("i", "<Tab>j", "<space><C-o>:call v:lua.RebindShit('_')<CR>")
utils.keymap("i", "<Tab>k", "<space><C-o>:call v:lua.RebindShit('::')<CR>")
utils.keymap("n", "\195\182", "a")
_G.clean_no_name_empty_buffers = function()
  local bufs
  local function _17_(_241)
    return (a["empty?"](vim.fn.bufname(_241)) and (vim.fn.bufwinnr(_241) < 0) and vim.api.nvim_buf_is_loaded(_241) and ("" == str.join(utils["buffer-content"](_241))) and vim.api.nvim_buf_get_option(_241, "buflisted"))
  end
  bufs = a.filter(_17_, vim.fn.range(1, vim.api.nvim_buf_get_number("$")))
  if not a["empty?"](bufs) then
    return vim.cmd(("bdelete " .. str.join(" ", bufs)))
  end
end
vim.cmd("autocmd! BufCreate * :call v:lua.clean_no_name_empty_buffers()")
do end (vim.o)["undodir"] = (vim.env.XDG_DATA_HOME .. "/nvim/undo")
vim.cmd("hi Search guibg=#485164")
vim.cmd("\n         augroup my-latex\n         autocmd FileType tex set spell spelllang=es,en_us\n         autocmd FileType tex hi SpellBad  gui=underline guifg=#cc6666\n         autocmd FileType tex set wrap linebreak \n         augroup END")
vim.cmd("set ic")
return vim.cmd("command! -nargs=1 L :lua print(vim.inspect(<args>))")