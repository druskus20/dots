local _2afile_2a = "dots/plugins/nvim-dap.fnl"
local _1_
do
  local name_4_auto = "dots.plugins.nvim-dap"
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
    return {autoload("aniseed.core"), autoload("dap"), autoload("dots.utils")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {a = "aniseed.core", dap = "dap", utils = "dots.utils"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local dap = _local_4_[2]
local utils = _local_4_[3]
local _2amodule_2a = _1_
local _2amodule_name_2a = "dots.plugins.nvim-dap"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
dap.adapters.cpp = {attach = {pidProperty = "pid", pidSelect = "ask"}, command = "lldb-vscode", env = {LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "yes"}, name = "lldb", type = "executable"}
dap.adapters.rust = {attach = {pidProperty = "pid", pidSelect = "ask"}, command = "lldb-vscode", env = {LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "yes"}, initCommands = {"command script import \"/home/leon/.rustup/toolchains/nightly-2021-03-18-x86_64-unknown-linux-gnu/lib/rustlib/etc/lldb_lookup.py\"", "type summary add --no-value --python-function lldb_rust_formatters.print_val -x \".*\" --category Rust", "type category enable Rust"}, name = "lldb", type = "executable"}
dap.adapters.node2 = {args = {"/home/leon/tmp/vscode-node-debug2/out/src/nodeDebug.js"}, command = "node", type = "executable"}
dap.configurations.javascript = {{console = "integratedTerminal", cwd = vim.fn.getcwd(), name = "javascript", program = "${workspaceFolder}/${file}", protocol = "inspector", request = "launch", sourceMaps = true, type = "node2"}}
return nil