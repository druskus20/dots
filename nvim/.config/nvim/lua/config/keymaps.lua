-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


-- TODO: these come from my old fennel config. I should definitely give them a second look
-- Disable command history
-- vim.keymap.set('n', 'q:', ':q')  -- creates a "wait time" if we plan to use q as quit
-- Remap q (record macro) to Q


local map = vim.keymap.set

map('n', 'q', '<Nop>')
map('n', 'Q', 'q')
map('n', '<S-K>', '<Nop>')

-- Helper function for which-key commands
local function cmd_string(s)
  return "<cmd>" .. s .. "<cr>"
end

-- Buffer navigation
local function is_floating_window()
  local win_id = vim.api.nvim_get_current_win()
  local win_config = vim.api.nvim_win_get_config(win_id)

  -- Check if it's a floating window
  return win_config.relative and win_config.relative ~= ""
end

local function smart_buffer_nav(cmd)
  return function()
    if not is_floating_window() then
      vim.cmd(cmd)
    end
    -- In floating windows, do nothing and let the window handle its own keymaps
  end
end

-- Buffer navigation
map('n', '<leader>h', function() smart_buffer_nav('bprevious')() end, { desc = 'Previous buffer' })
map('n', '<leader>l', function() smart_buffer_nav('bnext')() end, { desc = 'Next buffer' })
map('n', '<C-h>', function() smart_buffer_nav('bprevious')() end, { desc = 'Previous buffer' })
map('n', '<C-l>', function() smart_buffer_nav('bnext')() end, { desc = 'Next buffer' })
-- C+h conflicts with <esc>+<delete>
-- map('i', '<C-h>', function() smart_buffer_nav('bprevious')() end, { desc = 'Previous buffer' })
-- map('i', '<C-l>', function() smart_buffer_nav('bnext')() end, { desc = 'Next buffer' })
-- map('v', '<C-h>', function() smart_buffer_nav('bprevious')() end, { desc = 'Previous buffer' })
-- map('v', '<C-l>', function() smart_buffer_nav('bnext')() end, { desc = 'Next buffer' })


map('n', '<C-x>', cmd_string('bdelete'), { desc = 'Close buffer' })

-- Buffer management
map('n', '<leader>bc', cmd_string('bdelete!'), { desc = 'Close buffer' })
map('n', '<leader>bw', cmd_string('bwipeout!'), { desc = 'Wipeout buffer' })

-- Close floating windows
local function close_floating()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= '' then
      vim.api.nvim_win_close(win, false)
    end
  end
end

-- Use q and <esc> to close floating windows and clear search
-- Already handled by LazyVim
--map('n', '<esc>', function()
--  close_floating()
--  vim.cmd('nohlsearch')
--end)
--
--map('n', 'q', function()
--  close_floating()
--  vim.cmd('nohlsearch')
--end)

-- Exit visual mode without relying on <esc>
local function exit_visual_mode()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-c>', true, false, true), 'x', false)
end

-- Use q and <esc> to close floating windows and clear search in visual mode
map('v', '<esc>', function()
  close_floating()
  vim.cmd('nohlsearch')
  exit_visual_mode()
end)

map('v', 'q', function()
  close_floating()
  vim.cmd('nohlsearch')
  exit_visual_mode()
end)

-- Move up/down in menus with C-j and C-k
map({ 'i', 'n', 'c' }, '<C-j>', '<C-n>', { desc = 'Move down' })
map({ 'i', 'n', 'c' }, '<C-k>', '<C-p>', { desc = 'Move up' })

-- Better indenting
map('v', '<', '<gv', { desc = 'Reduce indent' })
map('v', '>', '>gv', { desc = 'Increase indent' })

-- Indenting in insert mode
map('i', '<S-tab>', '<C-D>', { desc = 'Decrease indent' })

-- handled by mini.move
map('v', '<tab>', '>gv', { desc = 'Increase indent' })
map('v', '<S-tab>', '<gv', { desc = 'Reduce indent' })

-- Clipboard operations
map('n', '<leader>y', '"+y', { desc = 'Copy (system)' })
map('v', '<leader>y', '"+y', { desc = 'Copy (system)' })
map('n', '<leader>p', '"+p', { desc = 'Paste (system)' })
map('v', '<leader>p', '"+p', { desc = 'Paste (system)' })

-- Copy-paste with Ctrl-C and Ctrl-V
-- map('v', '<C-c>', '"+y', { desc = 'Copy to system clipboard' }) -- BUG: C-c and esc are the same key
-- map('n', '<C-v>', '"+p', { desc = 'Paste from system clipboard' }) -- TODO: Can't use due to visual block issues

map('i', '<C-v>', '<C-o>"+p', { desc = 'Paste from system clipboard' })
map('v', '<C-v>', '"+p', { desc = 'Paste from system clipboard' })

-- Unmap default keybinds related to code (lsp)
vim.keymap.del('n', '<leader>cd')
vim.keymap.del('n', '<leader>cf')
vim.keymap.del('n', '<leader>cm')
vim.keymap.del('n', '<leader>cs')
vim.keymap.del('n', '<leader>cS')

-- Unmap saving
-- TODO: conflicts with other plugins
-- Maybe the way is just to fork the keymaps.lua file
vim.keymap.del('n', '<C-s>')
vim.keymap.del('i', '<C-s>')
vim.keymap.del('v', '<C-s>')



-- Unmap Shift-L and Shift-H for previous/next buffer
vim.api.nvim_set_keymap('n', '<S-l>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-h>', '', { noremap = true, silent = true })


-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>gd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })


map("n", "<leader>C",
  function()
    local result = vim.treesitter.get_captures_at_cursor(0)
    print(vim.inspect(result))
  end,
  { noremap = true, silent = false, desc = "Get highlight group under cursor" }
)

-- trouble
map("n", "<C-t>", "<cmd>Trouble diagnostics toggle filter.not.severity=vim.diagnostic.severity.HINT<cr>",
  { desc = "Trouble Diagnostics" })
map("n", "<leader>t", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble Diagnostics" })
vim.keymap.set("n", "<C-n>", function()
  if require("trouble").is_open() then
    require("trouble").next({ skip_groups = true, jump = true })
  end
end, { desc = "Next Trouble item if Trouble is open" })

vim.keymap.set("n", "<C-p>", function()
  if require("trouble").is_open() then
    require("trouble").prev({ skip_groups = true, jump = true })
  end
end, { desc = "Previous Trouble item if Trouble is open" })

-- Fix for Telescope's race condition with default C-F
map("n", "<C-F>", LazyVim.pick("files"), { noremap = true, silent = false })

-- Function to trigger diagnostics refresh
local function refresh_diagnostics()
  vim.diagnostic.setloclist({ open = false }) -- Update location list with latest diagnostics
  vim.diagnostic.show()                       -- Refresh signs and virtual text
  print("Diagnostics refreshed")
end


-- Map Enter key in insert mode to insert a newline AND refresh diagnostics
map('n', '<leader>r', refresh_diagnostics, { desc = 'Refresh diagnostics' })

-- TODO: this wont work unless I use custom kb binds  delete last word with Backspace (C-BS == C-H)
--map("i", "<C-H>", "<C-w>", { noremap = true, silent = true })
-- C-w deletes a word
map("i", "<C-w>", "<Nop>", { noremap = true, silent = true })

-- Terminal mode ESC to exit to normal mode
map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
