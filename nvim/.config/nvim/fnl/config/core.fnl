; core.fnl 
; Core settings and options

(module config.core 
  {autoload { nvim aniseed.nvim 
              core aniseed.core str aniseed.string
              utils config.utils
              colors config.colors}
   require-macros [config.macros]})

(when (vim.fn.has "termguicolors")
  (set vim.opt.termguicolors true))

(set vim.opt.foldmethod "marker")
(set vim.opt.showmode false) 
(set vim.opt.undofile true)
(set vim.opt.shortmess (.. vim.o.shortmess "c")) ; Don't give completion messages like 'match 1 of 2' or 'The only match'
(set vim.opt.hidden true)
(set vim.opt.encoding "utf-8")
(set vim.opt.compatible false)
(set vim.opt.cursorline true)
(set vim.opt.incsearch true)
(set vim.opt.hlsearch true)
(set vim.opt.inccommand "nosplit")
(set vim.opt.shiftwidth 2)
(set vim.opt.tabstop 2)
(set vim.opt.autoindent true)
(set vim.opt.smartindent true)
(set vim.opt.expandtab true)
(set vim.opt.wrap false)
(set vim.opt.swapfile false)
(set vim.opt.undolevels 10000)
(set vim.opt.foldcolumn "0")
;(set vim.opt.signcolumn "yes")
(set vim.opt.laststatus 2)
(set vim.opt.splitbelow true)
(set vim.opt.splitright true)
(set vim.opt.mouse "a")
(set vim.opt.shell "zsh")
(set vim.opt.background "dark")
(set vim.opt.switchbuf "usetab")
(set vim.opt.number false)
(set vim.opt.relativenumber false)
(set vim.opt.smartcase true)
(set vim.opt.copyindent true)
(set vim.opt.previewheight 38) 
(set vim.opt.scrolloff 1)
(set vim.opt.sidescrolloff 1)
(set vim.opt.smarttab true)
(set vim.opt.shiftround true)
(set vim.opt.softtabstop -1)
(set vim.opt.cmdheight 2)
(set vim.opt.backspace "indent,eol,start")
(set vim.opt.completeopt "menu,menuone,noselect") ; preview

; characters for lines and borders
(vim.opt.fillchars:append "vert:│")
(vim.opt.fillchars:append "fold:─")

; (set vim.opt.statusline "")        
; (vim.opt.fillchars:append "stl:─")

; Custom foldtext >>>
(fn _G.custom_foldtext []:
  (if (= vim.opt.foldmethod._value "marker")
    (str.join (core.butlast (str.split (vim.fn.getline vim.v.foldstart)
                                       (core.first (str.split vim.opt.foldmarker._value ",")))))
    (vim.fn.getline vim.v.foldstart)))
; <<<

(set vim.opt.foldtext "v:lua.custom_foldtext()")

; Move once colors are done
(utils.highlight-add :EndOfBuffer {:fg colors.dark0}) ; ~ 
(utils.highlight-add :CursorLineNr {:fg colors.light2 :bg colors.dark4}) ; This line number
(utils.highlight-add :LineNr {:fg colors.light5}) ; Other line numbers

; vim:foldmarker=>>>,<<<
