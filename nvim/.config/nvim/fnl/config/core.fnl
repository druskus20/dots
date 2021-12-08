; core.fnl 
; Core settings and options

(module config.core 
  {autoload { nvim aniseed.nvim 
              a aniseed.core str aniseed.string
              utils config.utils
              colors config.colors}
   require-macros [config.macros]})

; characters for lines and borders
(vim.opt.fillchars:append "vert:│")
(vim.opt.fillchars:append "fold:─")
;(vim.opt.fillchars:append "stl:─")

; Custom foldtext >>>
(fn _G.custom_foldtext []
  (if (= vim.opt.foldmethod._value "marker")
    (str.join (a.butlast (str.split (vim.fn.getline vim.v.foldstart)
                                    (a.first (str.split vim.opt.foldmarker._value ",")))))
    (vim.fn.getline vim.v.foldstart)))

(set vim.opt.foldtext "v:lua.custom_foldtext()")
; <<<

; General options >>> 
(set-opts
  :termguicolors true
  :foldmethod "marker"
  :showmode false
  :undofile true
  :shortmess (.. vim.o.shortmess "Ic") ; Don't give completion messages like 'match 1 of 2' or 'The only match'
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
  :ignorecase true
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

; Some temporal settings (TODO: actually redo this) >>>
; Disable command history and Ex mode
; (vim.api.nvim_set_keymap :n "q:" :<nop> {:noremap true :silent true}) ; FIX: No work
(utils.highlight :Search {:bg colors.dark4})  
(utils.highlight :IncSearch {:fg colors.neutral_aqua :bg colors.dark4})  
(vim.api.nvim_set_keymap :n "Q" :<nop> {:noremap true :silent true})
; Highlights
(utils.highlight-add :EndOfBuffer {:fg colors.dark1}) ; ~ 
(utils.highlight-add :CursorLineNr {:fg colors.light2 :bg colors.dark4}) ; This line number
(utils.highlight-add :LineNr {:fg colors.light5}) ; Other line numbers
; Fixes twilight issue
(utils.highlight-add :Normal {:bg colors.dark1}) 
; Completion popups
(utils.highlight-add :Pmenu {:bg colors.dark0}) 
(utils.highlight-add :PmenuSbar {:fg colors.dark0 :bg colors.dark0}) 
(utils.highlight-add :PmenuThumb {:fg colors.dark0 :bg colors.dark0}) 
(utils.highlight-add :PmenuSel {:bg colors.neutral_purple :fg colors.dark0}) 
(utils.highlight-add :NormalFloat {:bg colors.dark0}) 
(utils.highlight-add :VertSplit {:bg colors.dark0}) 

(utils.highlight-add :Sneak {:fg colors.light1 :bg colors.dark5}) ; labels
(utils.highlight-add :SneakScope {:fg colors.dark1 :bg colors.neutral_aqua}) ; cursor
(utils.highlight-add :RustInlayHint {:fg :#5b5f66}) ; labels


; Visual yank
(vim.cmd "autocmd! TextYankPost * silent! lua vim.highlight.on_yank {higroup=\"IncSearch\", timeout=300}")
(set vim.g.AutoPairsMultilineClose 0)

; rust.vim
(set vim.g.rust_clip_command "xclip -selection clipboard")
(set vim.g.vim_parinfer_filetypes ["carp" "fennel" "clojure"])
(set vim.g.copilot_filetyps {:carp false :fennel false :clojure false})

(set vim.g.parinfer_additional_filetypes ["yuck"])
(set vim.g.rustfmt_autosave 1)

; Minimap
(utils.highlight-add :MinimapHighlight {:bg :#3e4452 :fg :5b5f66}) ; labels
(utils.highlight-add :MinimapBaseHighlight {:fg colors.dark5}) ; labels
(set vim.g.minimap_highlight "MinimapHighlight")
(set vim.g.minimap_base_highlight "MinimapBaseHighlight")

(fn _G.clean_no_name_empty_buffers []
  (let [bufs (a.filter #(and (a.empty? (vim.fn.bufname $1))
                             (< (vim.fn.bufwinnr $1) 0)
                             (vim.api.nvim_buf_is_loaded $1)
                             (= "" (str.join (utils.buffer-content $1)))
                             (vim.api.nvim_buf_get_option $1 "buflisted"))
                       (vim.fn.range 1 (vim.api.nvim_buf_get_number "$")))]
    (when (not (a.empty? bufs))
      (vim.cmd (.. "bdelete " (str.join " " bufs))))))

(tset vim.lsp.handlers :textDocument/publishDiagnostics
      (vim.lsp.with vim.lsp.diagnostic.on_publish_diagnostics
                    {:severity_sort true}))

(vim.cmd "autocmd! BufCreate * :call v:lua.clean_no_name_empty_buffers()")
; <<< 

; vim:foldmarker=>>>,<<<
