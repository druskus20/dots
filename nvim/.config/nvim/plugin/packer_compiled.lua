-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/druskus/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/druskus/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/druskus/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/druskus/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/druskus/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  aniseed = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/aniseed"
  },
  ["antifennel-nvim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/antifennel-nvim"
  },
  ["any-jump.vim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/any-jump.vim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["compe-conjure"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/compe-conjure"
  },
  conjure = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/conjure"
  },
  detectindent = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\31dots.plugins.detect-indent\frequire\0" },
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/detectindent"
  },
  ["dhall-vim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/dhall-vim"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen", "DiffviewToggleFiles" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\26dots.plugins.diffview\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/opt/diffview.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["emmet-vim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\23dots.plugins.emmet\frequire\0" },
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\24dots.plugins.feline\frequire\0" },
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  ["fennel.vim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/fennel.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\26dots.plugins.gitsigns\frequire\0" },
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["haskell-vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/opt/haskell-vim"
  },
  ["kmonad.vim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/kmonad.vim"
  },
  ["lalrpop.vim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/lalrpop.vim"
  },
  ["lsp-trouble.nvim"] = {
    commands = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\25dots.plugins.trouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/opt/lsp-trouble.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\25dots.plugins.lspsaga\frequire\0" },
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\28dots.plugins.bufferline\frequire\0" },
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0 dots.plugins.nvim-colorizer\frequire\0" },
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\23dots.plugins.compe\frequire\0" },
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\28dots.plugins.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvim.lua"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/nvim.lua"
  },
  ["parinfer-rust"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/parinfer-rust"
  },
  playground = {
    loaded = false,
    needs_bufread = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["purescript-vim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/purescript-vim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["rust.vim"] = {
    config = { "\27LJ\2\n;\0\0\2\0\3\0\0066\0\0\0009\0\1\0)\1\1\0=\1\2\0+\0\0\0L\0\2\0\26rustfmt_fail_silently\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/opt/rust.vim"
  },
  ["sad.vim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/sad.vim"
  },
  sourcery = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\26dots.plugins.sourcery\frequire\0" },
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/sourcery"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/opt/startuptime.vim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0!dots.plugins.symbols-outline\frequire\0" },
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  tabular = {
    after_files = { "/home/druskus/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    commands = { "Tabularize" },
    loaded = false,
    needs_bufread = false,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/opt/tabular"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\27dots.plugins.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["typescript-vim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/typescript-vim"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-exchange"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-indent-guides"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-indent-guides"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-javascript"
  },
  ["vim-jsonc"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-jsonc"
  },
  ["vim-jsonnet"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-jsonnet"
  },
  ["vim-jsx"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-jsx"
  },
  ["vim-multiple-cursors"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-prettier"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-sneak"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\23dots.plugins.sneak\frequire\0" },
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tsx"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-tsx"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/webapi-vim"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["yats.vim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/yats.vim"
  },
  ["yuck.vim"] = {
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/yuck.vim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\26dots.plugins.zen-mode\frequire\0" },
    loaded = true,
    path = "/home/druskus/.local/share/nvim/site/pack/packer/start/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\23dots.plugins.compe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\26dots.plugins.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0!dots.plugins.symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0 dots.plugins.nvim-colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: vim-sneak
time([[Config for vim-sneak]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\23dots.plugins.sneak\frequire\0", "config", "vim-sneak")
time([[Config for vim-sneak]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\28dots.plugins.bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: emmet-vim
time([[Config for emmet-vim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\23dots.plugins.emmet\frequire\0", "config", "emmet-vim")
time([[Config for emmet-vim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\26dots.plugins.zen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: detectindent
time([[Config for detectindent]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\31dots.plugins.detect-indent\frequire\0", "config", "detectindent")
time([[Config for detectindent]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\24dots.plugins.feline\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: sourcery
time([[Config for sourcery]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\26dots.plugins.sourcery\frequire\0", "config", "sourcery")
time([[Config for sourcery]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\25dots.plugins.lspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewToggleFiles lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewToggleFiles", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tabularize lua require("packer.load")({'tabular'}, { cmd = "Tabularize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleClose lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "TroubleClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleRefresh lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "TroubleRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust.vim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType haskell ++once lua require("packer.load")({'haskell-vim'}, { ft = "haskell" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'nvim-treesitter', 'nvim-ts-context-commentstring', 'playground'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/druskus/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], true)
vim.cmd [[source /home/druskus/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]]
time([[Sourcing ftdetect script at: /home/druskus/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], false)
time([[Sourcing ftdetect script at: /home/druskus/.local/share/nvim/site/pack/packer/opt/haskell-vim/ftdetect/haskell.vim]], true)
vim.cmd [[source /home/druskus/.local/share/nvim/site/pack/packer/opt/haskell-vim/ftdetect/haskell.vim]]
time([[Sourcing ftdetect script at: /home/druskus/.local/share/nvim/site/pack/packer/opt/haskell-vim/ftdetect/haskell.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
