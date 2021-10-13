; core.fnl 
; Core settings and options

(module config.core 
  {autoload { nvim aniseed.nvim 
              core aniseed.core str aniseed.string
              utils config.utils
              colors config.colors}
   require-macros [config.macros]})

; characters for lines and borders
(vim.opt.fillchars:append "vert:│")
(vim.opt.fillchars:append "fold:─")
;(vim.opt.fillchars:append "stl:─")

; Custom foldtext >>>
(fn _G.custom_foldtext []:
  (if (= vim.opt.foldmethod._value "marker")
    (str.join (core.butlast (str.split (vim.fn.getline vim.v.foldstart)
                                       (core.first (str.split vim.opt.foldmarker._value ",")))))
    (vim.fn.getline vim.v.foldstart)))

(set vim.opt.foldtext "v:lua.custom_foldtext()")
; <<<

; General options >>> 
(set-opts
  :termguicolors true
  :foldmethod "marker"
  :showmode false
  :undofile true
  :shortmess (.. vim.o.shortmess "c") ; Don't give completion messages like 'match 1 of 2' or 'The only match'
  :hidden true
  :encoding "utf-8"
  :compatible false
  :cursorline true
  :incsearch true
  :hlsearch true
  :inccommand "nosplit"
  :shiftwidth 2
  :tabstop 2
  :autoindent true
  :smartindent true
  :expandtab true
  :wrap false
  :swapfile false
  :undolevels 10000
  :foldcolumn "0"
  :signcolumn "yes"
  :laststatus 2
  :splitbelow true
  :splitright true
  :mouse "a"
  :shell "zsh"
  :ruler false
  :background "dark"
  :switchbuf "usetab"
  :number false
  :relativenumber false
  :smartcase true
  :copyindent true
  :previewheight 38
  :scrolloff 1
  :sidescrolloff 1
  :smarttab true
  :shiftround true
  :softtabstop -1
  :cmdheight 2
  :backspace "indent,eol,start")
; <<< 

; TODO Move once colors are done >>>
(utils.highlight-add :EndOfBuffer {:fg colors.dark1}) ; ~ 
(utils.highlight-add :CursorLineNr {:fg colors.light2 :bg colors.dark4}) ; This line number
(utils.highlight-add :LineNr {:fg colors.light5}) ; Other line numbers
; Fixes twilight issue
(utils.highlight-add :Normal {:bg colors.dark1}) 
<<< 

; vim:foldmarker=>>>,<<<
