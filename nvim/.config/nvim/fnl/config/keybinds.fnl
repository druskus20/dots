; keybinds.fnl
; Set up keybinds **and which-key** 

(module config.keybinds
  {autoload {nvim aniseed.nvim
             wk which-key
             utils config.utils}
   require-macros [config.macros]})

(set nvim.o.timeoutlen 200)

; Keybinds >>>
(vim-let mapleader "\\<Space>")
(vim-let maplocalleader ",")
(utils.keymap :n :K :<Nop>)
(utils.keymap :v :K :<Nop>)
(utils.keymap :i :<C-l> :<DEL>)
(utils.keymap :n :<C-p> ":Telescope find_files<CR>")
(utils.keymap :n :<C-b> ":BufferLinePick<CR>")
(utils.keymap :i :<C-b> "<ESC>:BufferLinePick<CR>")
(utils.keymap [:n :o] :<DEL>   "<Plug>Sneak_s" {:noremap false})
(utils.keymap [:n :o] :<S-DEL> "<Plug>Sneak_S" {:noremap false})
; <<<

; Which Key >>> 
(wk.setup 
  {:icons {:group " "}
   :layout {:spacing 3
            :align :left
            :width {:min 30 :max 100}
            :height {:min 4 :max 25}}})

(fn cmd [s desc] [(.. "<cmd>" s "<cr>") desc])
(fn sel-cmd [s desc] [(.. "<cmd>'<,'>" s "<cr>") desc])
(fn rebind [s desc] [s desc])

(wk.register  
  {"h"  (cmd "bprevious"              "Previous buffer")
   "l"  (cmd "bnext"                  "Next buffer")
   "o"  (cmd "Telescope live_grep"    "Grep files")
   "p"  (cmd "Telescope find_files"   "Browse files")
   ":"  (cmd "Telescope commands"     "Search commands")
   "t"  (cmd "TroubleToggle"          "Trouble")
   "w"  (cmd "w"                      "Save file")
   "s"  (cmd "sp"                     "Split Horizontally")
   "S"  (cmd "vs"                     "Split vertically")

   "m" {:name "+Code actions"
        "d" (cmd "Lspsaga hover_doc"                       "Show documentation") 
        "b" (cmd "Lspsaga lsp_finder"                      "Find stuff") 
        "x" (cmd "Lspsaga preview_definition"              "Preview definition") 
        "o" (cmd "SymbolsOutline"                          "Outline") 
        "S" (cmd "Telescope lsp_document_symbols"          "Symbols in document") 
        "s" (cmd "Telescope lsp_dynamic_workspace_symbols" "Symbols in workspace") 
        "T" (cmd "Lspsaga signature_help"                  "Show signature help") 
        "n" (cmd "Lspsaga rename"                          "Rename") 
        "v" (cmd "Lspsaga code_action"                     "Apply codeaction") 
        "A" (cmd "Lspsaga show_cursor_diagnostics"         "Cursor diagnostics") 
        "a" (cmd "Lspsaga show_line_diagnostics"           "Line diagnostics")
        "h" (cmd "RustToggleInlayHints"                    "Toggle inlay hints")
        "r" (cmd "Trouble lsp_references"                  "Show references") 
        "E" (cmd "Trouble lsp_document_diagnostics"        "List diagnostics")
        "e" (cmd "Trouble lsp_workspace_diagnostics"       "Show diagnostics")
        "t" [vim.lsp.buf.declaration                       "Go to declaration"] 
        "g" [vim.lsp.buf.definition                        "Go to definition"] 
        "i" (cmd "Trouble lsp_implementations"             "Show implementation") 
        "f" [format                                        "Format file"]
        "," (cmd "RustRunnables"                           "Run rust stuff")}
   
   "f" {:name "+Folds"
        "o" (cmd "foldopen"  "Open fold") 
        "n" (cmd "foldclose" "Close fold") 
        "j" (rebind "zj"     "Next fold") 
        "k" (rebind "zk"     "Previous fold")}

   "b" {:name "+Buffers"
        "c" (cmd "bdelete!"  "Close buffer")
        "w" (cmd "bwipeout!" "Wipeout buffer")}
   
   "v" {:name "+View"
        "n" (cmd "set nonumber! norelativenumber!"  "Numbers") 
        "c" (cmd "set nocursorline!"                "Cursor line") 
        "z" (cmd "ZenMode"                          "Zen mode") 
        "i" (cmd "IndentGuidesToggle"               "Indent guides")
        "t" (cmd "Twilight"                         "Twilight")}} 
   
  {:prefix :<leader>
   :mode :n})
; <<<

; vim:foldmarker=>>>,<<<
