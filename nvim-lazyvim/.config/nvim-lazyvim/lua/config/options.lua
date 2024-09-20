-- Options are automatically loaded before lazy.nvim startup
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.netrw_banner = 0
vim.g.markdown_recommended_style = 0 -- fix vim ignores shoftabstop in markdown

local opt = vim.opt
opt.autowrite = true
opt.exrc = true
opt.completeopt = ""
opt.conceallevel = 3
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.laststatus = 0
opt.mouse = "a"
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 4
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess:append({
  I = true, -- Suppress intro message
  W = true, -- Suppress "written" message when saving a file
  c = true  -- Suppress completion messages
})
opt.showmode = false
opt.sidescrolloff = 8
opt.smartcase = true
opt.smartindent = true
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
opt.wrap = false
opt.compatible = false
opt.hidden = true
opt.encoding = "utf-8"
opt.autoindent = true
opt.incsearch = true
opt.ruler = false
opt.switchbuf = "usetab"
opt.smarttab = true
opt.copyindent = true
opt.previewheight = 38
opt.softtabstop = -1
opt.backspace = "indent,eol,start"
opt.swapfile = false
opt.foldcolumn = "0"
opt.signcolumn = "yes"
opt.laststatus = 3
opt.shell = "zsh"
opt.cmdheight = 1
opt.showcmd = false
opt.cmdheight = 0
opt.splitkeep = "screen"

return nil
