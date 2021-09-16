local _2afile_2a = "dots/plugins/lsp.fnl"
local _1_
do
  local name_4_auto = "dots.plugins.lsp"
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
    return {autoload("aniseed.core"), autoload("lspconfig"), autoload("lspconfig/configs"), autoload("dots.utils")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {["require-macros"] = {macros = true}, autoload = {["lsp-configs"] = "lspconfig/configs", a = "aniseed.core", lsp = "lspconfig", utils = "dots.utils"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local lsp = _local_4_[2]
local lsp_configs = _local_4_[3]
local utils = _local_4_[4]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.plugins.lsp"
do local _ = ({nil, _1_, nil, {{nil}, nil, nil, nil}})[2] end
local function on_attach(client, bufnr)
  if (nil ~= packer_plugins["lsp_signature.nvim"]) then
    local lsp_signature = require("lsp_signature")
    lsp_signature.on_attach({bind = true, decorator = {"`", "`"}, handler_opts = {border = "single"}, hint_prefix = "\198\146 ", hint_scheme = "String", use_lspsaga = false})
  else
    print(("plugin disabled " .. "lsp_signature.nvim"))
  end
  if client.resolved_capabilities.document_highlight then
    utils.highlight("LspReferenceRead", {gui = "underline"})
    utils.highlight("LspReferenceText", {gui = "underline"})
    utils.highlight("LspReferenceWrite", {gui = "underline"})
    return vim.api.nvim_exec("augroup lsp_document_highlight\n        autocmd! * <buffer> \n        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight() \n        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n        augroup END", false)
  end
end
local function better_root_pattern(patterns, except_patterns)
  local function _10_(path)
    if not lsp.util.root_pattern(except_patterns)(path) then
      return lsp.util.root_pattern(patterns)(path)
    end
  end
  return _10_
end
local default_capabilities
do
  local v_23_auto
  do
    local v_25_auto
    do
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      v_25_auto = capabilities
    end
    _1_["default-capabilities"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["default-capabilities"] = v_23_auto
  default_capabilities = v_23_auto
end
local function init_lsp(lsp_name, _3fopts)
  local merged_opts = a.merge({capabilities = default_capabilities, on_attach = on_attach}, (_3fopts or {}))
  return lsp[lsp_name].setup(merged_opts)
end
init_lsp("tsserver")
local function _12_()
  return vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
end
init_lsp("jsonls", {commands = {Format = {_12_}}})
init_lsp("hls", {settings = {languageServerHaskell = {formattingProvider = "stylish-haskell"}}})
init_lsp("ocamllsp")
init_lsp("vimls")
init_lsp("bashls")
init_lsp("erlangls")
init_lsp("yamlls")
init_lsp("html")
init_lsp("gopls")
init_lsp("purescriptls")
init_lsp("cssls", {filestypes = {"css", "scss", "less", "stylus"}, root_dir = lsp.util.root_pattern({"package.json", ".git"}), settings = {css = {validate = true}, less = {validate = true}, scss = {validate = true}}})
init_lsp("texlab", {settings = {texlab = {build = {args = {"-pdf", "-pvc", "-synctex=1", "-interaction=nonstopmode", "%f"}, isContinuous = true}, chktex = {onEdit = true, onOpenAndSave = true}}}})
do
  local rust_tools = require("rust-tools")
  rust_tools.setup({tools = {inlay_hints = {show_parameter_hints = false}}})
end
do
  local sumneko_root_path = (vim.env.HOME .. "/.local/share/lua-language-server")
  local sumneko_binary = (sumneko_root_path .. "/bin/Linux/lua-language-server")
  init_lsp("sumneko_lua", {cmd = {sumneko_binary, "-E", (sumneko_root_path .. "/main.lua")}, settings = {Lua = {diagnostics = {globals = {"vim"}}, runtime = {path = vim.split(package.path, ";"), version = "LuaJIT"}, telemetry = false, workspace = {library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true}}}}})
end
if not lsp.prolog_lsp then
  local function _13_(fname)
    return (lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir())
  end
  lsp_configs["prolog_lsp"] = {default_config = {cmd = {"swipl", "-g", "use_module(library(lsp_server)).", "-g", "lsp_server:main", "-t", "halt", "--", "stdio"}, filetypes = {"prolog"}, root_dir = _13_, settings = {}}}
end
lsp.prolog_lsp.setup({})
do end (vim.wo)["signcolumn"] = "yes"
return nil