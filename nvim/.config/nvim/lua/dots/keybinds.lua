local _2afile_2a = "dots/keybinds.fnl"
local _1_
do
  local name_4_auto = "dots.keybinds"
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
    return {autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("nvim-treesitter.incremental_selection"), autoload("dots.utils"), autoload("which-key")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {["require-macros"] = {macros = true}, autoload = {["treesitter-selection"] = "nvim-treesitter.incremental_selection", a = "aniseed.core", nvim = "aniseed.nvim", utils = "dots.utils", wk = "which-key"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local nvim = _local_4_[2]
local treesitter_selection = _local_4_[3]
local utils = _local_4_[4]
local wk = _local_4_[5]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.keybinds"
do local _ = ({nil, _1_, nil, {{nil}, nil, nil, nil}})[2] end
vim.g.AutoPairsShortcutBackInsert = "<M-b>"
utils.keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>")
utils.keymap("n", "<C-y>", "<cmd>Telescope find_files cwd=~/doc/tfg<cr>")
utils.keymap("i", "<C-L>", "<Esc>[s1z=`]a")
utils.keymap("n", "<C-L>", "[s1z=`]")
utils.keymap("n", "Q", "<Nop>")
utils.keymap("n", "K", "<Nop>")
utils.keymap("v", "K", "<Nop>")
utils.keymap("n", "MM", "<cmd>lua require('nvim-gehzu').go_to_definition()<CR>", {})
utils.keymap("n", "MN", "<cmd>lua require('nvim-gehzu').show_definition()<CR>", {})
local function cmd(s, desc)
  return {("<cmd>" .. s .. "<cr>"), desc}
end
local function rebind(s, desc)
  return {s, desc}
end
wk.setup({})
wk.register({[":"] = cmd("Telescope commands", "Search command with fzf"), b = {b = cmd("Buffers", "select open buffer"), c = cmd("bdelete!", "close open buffer"), name = "+buffers", w = cmd("bwipeout!", "wipeout open buffer")}, c = {name = "+comment out"}, e = {name = "+emmet"}, f = {j = rebind("zj", "jump to next fold"), k = rebind("zk", "jump to previous fold"), n = cmd("foldclose", "close fold"), name = "+folds", o = cmd("foldopen", "open fold")}, h = cmd("bprevious", "previous buffer"), l = cmd("bnext", "next buffer"), m = {A = cmd("Lspsaga show_cursor_diagnostics", "Cursor diagnostics"), E = cmd("Trouble lsp_document_diagnostics", "List diagnostics"), S = cmd("Telescope lsp_document_symbols", "Symbols in document"), a = cmd("Lspsaga show_line_diagnostics", "Line diagnostics"), b = cmd("Lspsaga lsp_finder", "Find stuff"), d = cmd("Lspsaga hover_doc", "Show documentation"), e = cmd("Trouble lsp_workspace_diagnostics", "Show diagnostics"), f = {vim.lsp.buf.formatting, "format file"}, g = {vim.lsp.buf.definition, "Go to definition"}, h = cmd("RustToggleInlayHints", "Toggle inlay hints"), i = {vim.lsp.buf.implementation, "Show implementation"}, n = cmd("Lspsaga rename", "Rename"), name = "+Code actions", o = cmd("SymbolsOutline", "Outline"), r = cmd("Trouble lsp_references", "Show references"), s = cmd("Telescope lsp_dynamic_workspace_symbols", "Symbols in workspace"), t = cmd("Lspsaga signature_help", "Show signature help"), v = cmd("Lspsaga code_action", "Apply codeaction"), x = cmd("Lspsaga preview_definition", "Preview definition")}, o = cmd("Telescope live_grep", "Grep files"), p = cmd("Telescope file_browser", "Open file-browser"), v = {i = cmd("IndentGuidesToggle", "toggle indent guides"), n = cmd("set relativenumber!", "toggle relative numbers"), name = "+view-and-layout", r = cmd("set nonumber! norelativenumber", "toggle numbers"), z = cmd("ZenMode", "toggle zen mode")}}, {prefix = "<leader>"})
wk.register({["<tab>"] = "which_key_ignore", gss = "init selection", z = {c = cmd("foldclose", "close fold"), name = "+folds", o = cmd("foldopen", "open fold")}})
wk.register({["<tab>"] = "which_key_ignore"}, {mode = "i"})
wk.register({h = "decrement node", j = "increment selection", k = "decrement selection", l = "increment node", name = "+Selection"}, {mode = "v", prefix = "gs"})
nvim.o.timeoutlen = 200
return nil