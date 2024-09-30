-- [nfnl] Compiled from fnl/plugins/lualine.fnl by https://github.com/Olical/nfnl, do not edit.
local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if (recording_register == "") then
    return ""
  else
    return ("Recording @" .. recording_register)
  end
end
local function _2_(_, opts)
  local lualine = require("lualine")
  lualine.setup(opts)
  local function _3_()
    return lualine.refresh({ place = { "statusline" } })
  end
  return vim.api.nvim_create_autocmd("RecordingEnter", { callback = _3_ })
end
local function _4_()
  local function _5_()
    return ("\239\145\175  " .. require("dap").status())
  end
  local function _6_()
    return (package.loaded.dap and (require("dap").status() ~= ""))
  end
  return { extensions = { "neo-tree", "lazy" }, options = { component_separators = { left = "\226\148\130", right = "\226\148\130" }, section_separators = { left = " ", right = " " }, disabled_filetypes = { statusline = { "dashboard", "alpha" } }, globalstatus = true, theme = "auto" }, sections = { lualine_a = { "mode" }, lualine_b = { "branch" }, lualine_c = { { "diagnostics" }, { "filetype", icon_only = true, padding = { left = 1, right = 0 }, separator = "" }, { "filename", path = 1, symbols = { modified = " \239\131\182 ", readonly = "", unnamed = "" } } }, lualine_x = { { _5_, cond = _6_ }, { require("lazy.status").updates, cond = require("lazy.status").has_updates }, { "diff" } }, lualine_y = { { "macro-recording", fmt = show_macro_recording }, { "location", padding = { left = 0, right = 1 } } }, lualine_z = {} }, tabline = { lualine_b = { { "buffers", max_length = 99999999, padding = { left = 1, right = 1 }, symbols = { alternate_file = "" } } } } }
end
return { { "nvim-lualine/lualine.nvim", event = "VeryLazy", enabled = true, config = _2_, opts = _4_ } }
