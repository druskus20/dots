; Loaded before plugins by plugins/core.fnl

; Make sure to set `mapleader` before lazy so your mappings are correct
(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")


(local opt vim.opt)
(set opt.autowrite true)
(set opt.exrc true) ; per project config https://github.com/Olical/nfnl?tab=readme-ov-file#directory-local-neovim-configuration-in-fennel
;(set opt.clipboard :unnamedplus)
(set opt.completeopt "") ; Important, so it does not conflict with cmp
(set opt.conceallevel 3)
(set opt.confirm true)
(set opt.cursorline true)
(set opt.expandtab true)
(set opt.formatoptions :jcroqlnt)
(set opt.grepformat "%f:%l:%c:%m")
(set opt.grepprg "rg --vimgrep")
(set opt.ignorecase true)
(set opt.inccommand :nosplit)
(set opt.laststatus 0)
;(set opt.list true) ; display indentation
(set opt.mouse :a)
(set opt.number true)
(set opt.pumblend 10)
(set opt.pumheight 10)
(set opt.relativenumber true)
(set opt.scrolloff 4)
(set opt.sessionoptions [:buffers :curdir :tabpages :winsize])
(set opt.shiftround true)
(set opt.shiftwidth 2)
(opt.shortmess:append {:I true :W true :c true})
(set opt.showmode false)
(set opt.sidescrolloff 8)
(set opt.signcolumn :yes)
(set opt.smartcase true)
(set opt.smartindent true)
(set opt.spelllang [:en])
(set opt.splitbelow true)
(set opt.splitright true)
(set opt.tabstop 2)
(set opt.termguicolors true)
(set opt.timeoutlen 300)
(set opt.undofile true)
(set opt.undolevels 10000)
(set opt.updatetime 200)
(set opt.wildmode "longest:full,full")
(set opt.winminwidth 5)
(set opt.wrap false)
(set opt.compatible false)

; mine
(set opt.hidden true)
(set opt.encoding "utf-8")
(set opt.autoindent true)
(set opt.incsearch true)
(set opt.ruler false)
(set opt.switchbuf "usetab")
(set opt.smarttab true)
(set opt.copyindent true)
(set opt.previewheight 38)
(set opt.softtabstop -1)
(set opt.backspace "indent,eol,start")
(set opt.swapfile false)
(set opt.foldcolumn "0")
(set opt.signcolumn "yes")
(set opt.laststatus 3) ; vs 0
(set opt.shell "zsh")
;:scrolloff 1
;:background "dark"
;:number false
;:relativenumber false
;:sidescrolloff 1

(set opt.cmdheight 1)
(set opt.showcmd false)
(set opt.cmdheight 0)

(set vim.g.netrw_banner 0)


(when (= (vim.fn.has :nvim-0.9.0) 1) (set opt.splitkeep :screen)
  (opt.shortmess:append {:C true}))
(set vim.g.markdown_recommended_style 0)

