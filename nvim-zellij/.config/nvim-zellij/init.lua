-- Options are automatically loaded before lazy.nvim startup
vim.g.mapleader = " "                -- Set space as the leader key
vim.g.maplocalleader = ","           -- Set comma as the local leader key
vim.g.netrw_banner = 0               -- Disable netrw banner
vim.g.markdown_recommended_style = 0 -- Fix vim ignores shoftabstop in markdown

local opt = vim.opt
opt.autowrite = true  -- Auto-save before certain actions
opt.exrc = true       -- Allow local .vimrc files in directories
opt.completeopt = ""  -- Disable built-in completion behavior
opt.conceallevel = 3  -- Hide markup characters in files like markdown
opt.confirm = true    -- Confirm to save changes before closing
opt.cursorline = true -- Highlight the current line
opt.expandtab = true  -- Convert tabs to spaces

-- As of nvim 0.9, gqq is broken. Use gww instead, or override:
-- vim.opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
-- (set by lazyvim)
--opt.formatexpr = ""

opt.formatoptions = "jcroqlnt" -- Set format options for comments and text wrapping
opt.grepformat = "%f:%l:%c:%m" -- Format for showing grep results
opt.grepprg = "rg --vimgrep"   -- Use ripgrep for searching
opt.ignorecase = true          -- Ignore case in search patterns
opt.inccommand = "nosplit"     -- Live preview of substitution changes
opt.laststatus = 0             -- Hide the status line initially
opt.mouse = "a"                -- Enable mouse support
opt.number = false             -- Show line numbers
opt.pumblend = 10              -- Set popup menu transparency
opt.pumheight = 10             -- Limit popup menu height
opt.relativenumber = false     -- Show relative line numbers
opt.scrolloff = 4              -- Minimal lines to keep above and below cursor
opt.sessionoptions = {         -- Session persistence settings
  "buffers",
  "curdir",
  "tabpages",
  "winsize"
}
opt.shiftround = true              -- Round indent to multiple of `shiftwidth`
opt.shiftwidth = 2                 -- Number of spaces to use for indentation
opt.shortmess:append({
  I = true,                        -- Suppress intro message
  W = true,                        -- Suppress "written" message when saving a file
  c = true                         -- Suppress completion messages
})
opt.showmode = false               -- Don't show mode in command line (like -- INSERT --)
opt.sidescrolloff = 8              -- Columns to keep left/right of the cursor during horizontal scroll
opt.smartcase = true               -- Override `ignorecase` if search contains uppercase letters
opt.smartindent = true             -- Smart auto-indentation
opt.spelllang = { "en" }           -- Set language for spell check to English
opt.splitbelow = true              -- Force all horizontal splits to go below current window
opt.splitright = true              -- Force all vertical splits to go to the right
opt.tabstop = 2                    -- Number of spaces tabs count for
opt.termguicolors = true           -- Enable 24-bit RGB colors in the terminal
opt.timeoutlen = 300               -- Time to wait for a mapped sequence to complete
opt.undofile = true                -- Enable persistent undo
opt.undolevels = 10000             -- Maximum number of undo levels
opt.updatetime = 200               -- Faster completion (default is 4000ms)
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.wrap = false                   -- Don't wrap lines by default
opt.compatible = false             -- Disable 'compatible' mode to use modern features
opt.hidden = true                  -- Allow switching buffers without saving
opt.encoding = "utf-8"             -- Set file encoding to UTF-8
opt.autoindent = true              -- Copy indent from current line when starting a new line
opt.incsearch = true               -- Show search matches as you type
opt.ruler = false                  -- Don't show ruler (line and column info)
opt.switchbuf = "usetab"           -- Reuse existing tabs for switching buffers
opt.smarttab = true                -- Make tab behavior context-sensitive
opt.copyindent = true              -- Copy indent from previous line
opt.previewheight = 38             -- Set height for preview windows
opt.softtabstop = -1               -- Use `shiftwidth` for tab size in editing
opt.backspace = "indent,eol,start" -- Allow backspacing over everything in insert mode
opt.swapfile = false               -- Disable swap file creation
opt.foldcolumn = "0"               -- No fold column on the left
opt.signcolumn = "yes"             -- Always show the sign column
opt.laststatus = 3                 -- Global status line
opt.shell = "zsh"                  -- Set default shell to zsh
--opt.cmdheight = 1                  -- Set height of command line to 1
opt.showcmd = true                 -- Hide command in progress in command line
opt.cmdheight = 0                  -- Hide command line when not in use
opt.splitkeep = "screen"           -- Keep view stable when splitting
opt.statuscolumn = ""              -- Customize status column
opt.clipboard = ""                 -- Do not use system clipboard

opt.virtualedit = "all"            -- Move on empty space

-- Color configuration (Gruvbox Light palette)
local colors = {
  -- Light theme (latte)
  light = {
    bg = "#fbf1c7",
    mantle = "#e9dbb1",
    crust = "#e0cfa0",
    surface0 = "#f2e5bc",
    surface1 = "#ebdbb2",
    surface2 = "#d5c4a1",
    text = "#3c3836",
    subtext1 = "#504945",
    subtext0 = "#665c54",
    overlay2 = "#7c6f64",
    overlay1 = "#928374",
    overlay0 = "#a89984",
    red = "#b83229",
    maroon = "#9a3a34",
    flamingo = "#9d2b22",
    peach = "#d65d0e",
    yellow = "#b57e22",
    green = "#7c7b20",
    teal = "#4a8568",
    blue = "#1a7088",
    sky = "#427b58",
    sapphire = "#076678",
    pink = "#8f3f71",
    mauve = "#8f3f71",
  },
  -- Dark theme (mocha)
  dark = {
    bg = "#282828",
    mantle = "#1d2021",
    crust = "#1b1b1b",
    surface0 = "#32302f",
    surface1 = "#3c3836",
    surface2 = "#504945",
    text = "#bfb191",
    subtext1 = "#d5c4a1",
    subtext0 = "#bdae93",
    overlay2 = "#a89984",
    overlay1 = "#928374",
    overlay0 = "#7c6f64",
    red = "#ea6962",
    maroon = "#d75f5f",
    flamingo = "#ea6962",
    peach = "#e78a4e",
    yellow = "#d8a657",
    green = "#a9b665",
    teal = "#89b482",
    blue = "#7daea3",
    sky = "#89b482",
    sapphire = "#7daea3",
    pink = "#d3869b",
    mauve = "#d3869b",
  }
}

-- Set background to light
vim.o.background = "light"

local c = colors.light

-- Set highlights using Lua API
local set_hl = vim.api.nvim_set_hl

set_hl(0, "Normal", { bg = c.bg, fg = c.text })
set_hl(0, "NormalNC", { bg = c.bg, fg = c.text })

-- Base highlights
set_hl(0, "NonText", { fg = c.overlay0 })
set_hl(0, "Whitespace", { fg = c.overlay0 })
set_hl(0, "LineNr", { fg = c.overlay1 })
set_hl(0, "CursorLine", { bg = c.surface0 })
set_hl(0, "CursorLineNr", { fg = c.text, bg = c.surface0 })

-- Borders and float windows
set_hl(0, "NormalBorder", { bg = c.mantle, fg = c.mantle })
set_hl(0, "FloatBorder", { bg = c.mantle, fg = c.mantle })
set_hl(0, "FloatTitle", { bg = c.red, fg = c.crust })
set_hl(0, "MsgArea", { bg = c.mantle, fg = c.text })

-- Spelling
set_hl(0, "SpellBad", { fg = c.red, undercurl = true })
set_hl(0, "SpellCap", { fg = c.red, undercurl = true })
set_hl(0, "SpellLocal", { fg = c.red, undercurl = true })
set_hl(0, "SpellRare", { fg = c.red, undercurl = true })




