; keybinds.fnl
; Set up keybinds **and which-key** 

(module config.keybinds
  {autoload {a aniseed.core
             nvim aniseed.nvim
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
(utils.keymap :n :<C-S> ":SymbolsOutline<Cr>")
(utils.keymap :n :<C-p> ":Telescope find_files<CR>")
(utils.keymap :n :<C-b> ":BufferLinePick<CR>")
(utils.keymap :i :<C-b> "<ESC>:BufferLinePick<CR>")
(utils.keymap [:n :o] :s "<Plug>Sneak_s" {:noremap false})
(utils.keymap [:n :o] :S "<Plug>Sneak_S" {:noremap false})
; <<<

; Which Key >>> 
(wk.setup 
  {:icons {:separator "→"
           :group ""}
   :layout {:spacing 3
            :align :left
            :width {:min 30 :max 100}
            :height {:min 4 :max 25}}})

(fn cmd [s desc] [(.. "<cmd>" s "<cr>") desc])
(fn sel-cmd [s desc] [(.. "<cmd>'<,'>" s "<cr>") desc])
(fn rebind [s desc] [s desc])
(defn format []
  (if (a.some #$1.resolved_capabilities.document_formatting (vim.lsp.get_active_clients))
    (vim.lsp.buf.formatting)
    (vim.cmd "Neoformat"))) ; !!!: This is not installed

(defn code-action []
  (if (= vim.bo.filetype :rust)
    (vim.cmd "RustCodeAction")
    (vim.cmd "Lspsaga code_action")))

(set vim.g.diagnostics_visible true)
(defn toggle-diagnostics []
  (if vim.g.diagnostics_visible
      (do
        (set vim.g.diagnostics_visible false)
        (vim.diagnostic.disable))
      (do
        (set vim.g.diagnostics_visible true)
        (vim.diagnostic.enable))))

(wk.register  
  {"h"  (cmd "bprevious"                    "Previous buffer")
   "l"  (cmd "bnext"                        "Next buffer")
   "L"  [(. (require :persistence) :load)   "Load last session"]
   "o"  (cmd "Telescope live_grep"          "Grep files")
   "p"  (cmd "Telescope find_files"         "Browse files")
   ":"  (cmd "Telescope commands"           "Search commands")
   "d" {:name "+Debug"
        "b" [#(req dap.toggle_breakpoint)    "Toggle breakpoint"]
        "u" [#(req dapui.toggle)             "Toggle dap ui"]
        "c" [#(req dap.step_into)            "Continue"]
        "r" [(. (require "dap") :repl :open) "Open repl"]
        "s" {:name "+Step"
             "o" [#(req dap.step_over)       "Step over"]
             "u" [#(req dap.step_out)        "Step out"]
             "i" [#(req dap.step_into)       "Step into"]}}
   "e"  (cmd "TroubleToggle workspace_diagnostics"              "Browse errors")
   "y"  (rebind "\"+y"                    "Yank to system clipboard")
   "t"  (cmd "TodoTrouble"                "Browse TODOs")
   "w"  (cmd "w"                          "Save file")
   "s"  (cmd "sp"                         "Split horizontally")
   "S"  (cmd "vs"                         "Split vertically")
   "a" {:name "+AnyJump"}
   "m" {:name "+Code actions"
        ;"d" [vim.lsp.buf.hover                        "Show documentation"] 
        "d" (cmd "Lspsaga hover_doc"                       "Show documentation") 
        "l"  [toggle-diagnostics               "Toggle diagnostics"]
        ;"b" (cmd "Lspsaga lsp_finder"                      "Find stuff") 
        "x" (cmd "Lspsaga preview_definition"              "Preview definition") 
        "o" (cmd "SymbolsOutline"                          "Symbols Outline") 
        "m" (cmd "MinimapToggle"                           "Minimap") 
        "S" (cmd "Telescope lsp_document_symbols"          "Symbols in document") 
        "s" (cmd "Telescope lsp_dynamic_workspace_symbols" "Symbols in workspace") 
        "T" [vim.lsp.buf.signature_help                    "Show signature help"] 
        "n" (cmd "Lspsaga rename"                          "Rename") 
        ;"v" [code-action                                    "Apply codeaction"] 
        "v" (cmd "Lspsaga code_action"                     "Apply codeaction") 
        ;"V" (cmd "Lspsaga range_code_action"               "Apply range codeaction") 
        ;"V" (cmd "CodeActionMenu"                           "Apply codeaction") ; It seems to work though
        "A" (cmd "Lspsaga show_cursor_diagnostics"         "Cursor diagnostics") 
        "a" (cmd "Lspsaga show_line_diagnostics"           "Line diagnostics")
        "h" (cmd "RustToggleInlayHints"                    "Toggle inlay hints")
        "r" (cmd "TroubleToggle lsp_references"                  "Show references") 
        "E" (cmd "TroubleToggle document_diagnostics"        "List diagnostics")
        "e" (cmd "TroubleToggle workspace_diagnostics"       "Show diagnostics")
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
        "i" (cmd "IndentBlanklineToggle"            "Indent guides")
        "t" (cmd "Twilight"                         "Twilight")}} 
   
  {:prefix :<leader>
   :mode :n})

(wk.register 
  {"c" {:name "+NerdCommenter"
        "$"       (cmd "<Plug>NERDCommenterToEOL"         "To EOL")
        "<space>" (cmd "<Plug>NERDCommenterToggle"        "Toggle")
        "a"       (cmd "<Plug>NERDCommenterAltDelims"     "Alt delimiters")  
        "A"       (cmd "<Plug>NERDCommenterAppend"        "Append") 
        "b"       (cmd "<Plug>NERDCommenterAlignBoth"     "Align both") 
        "c"       (cmd "<Plug>NERDCommenterComment"       "Comment") 
        "i"       (cmd "<Plug>NERDCommenterInvert"        "Invert") 
        "l"       (cmd "<Plug>NERDCommenterAlignLeft"     "Align left") 
        "m"       (cmd "<Plug>NERDCommenterMinimal"       "Minimal") 
        "n"       (cmd "<Plug>NERDCommenterNested"        "Nested") 
        "s"       (cmd "<Plug>NERDCommenterSexy"          "Sexy") 
        "u"       (cmd "<Plug>NERDCommenterUncomment"     "Uncomment") 
        "y"       (cmd "<Plug>NERDCommenterYank"          "Yank")}}
  {:prefix :<leader>
   :noremap false
   :mode :n})


(wk.register  
  {"m" {:name "+Code actions"
        "v" (cmd "Lspsaga range_code_action"               "Apply range codeaction")}} 
  {:prefix :<leader>
   :mode :v})
; <<<

; vim:foldmarker=>>>,<<<
