
; Loaded on "VeryLazy" event. Only user keys. Plugin-specific keys
; should be configured on it's respective plugin config. 
; Which-key keys or groups should be configured in which_key.fnl. 

; disable command history
; (vim.keymap.set :n "q:" ":q") ; creates a "wait time" if we plan to use q as quit
; remap q (record macro) to Q

(vim.keymap.set :n "q" "<Nop>")
(vim.keymap.set :n "Q" "q")

(vim.keymap.set :n :<S-K> "<Nop>")


(local {: autoload} (require :nfnl.module))

; TODO: improve
(local util (autoload :util))
(local map util.safe_keymap_set)

; For which key keybinds
; (fn cmd [s desc] [(.. "<cmd>" s "<cr>") desc])
; (fn sel-cmd [s desc] [(.. "<cmd>'<,'>" s "<cr>") desc])

(fn cmd_string [s] (.. "<cmd>" s "<cr>")) ; TODO: Change

; TODO: Funny macro / function  that accepts a table with maps, similar to wk.register
; (alternatively I could just require wk, now that keybinds are ALWAYS lazy loaded)
(map "n" "<leader>h" (cmd_string "bprevious") { :desc "Previous buffer"})
(map "n" "<leader>l" (cmd_string "bnext") { :desc "Next buffer"})
(map "n" "<C-h>" (cmd_string "bprevious") { :desc "Previous buffer"})
(map "n" "<C-l>" (cmd_string "bnext") { :desc "Next buffer"})
(map "i" "<C-h>" (cmd_string "bprevious") { :desc "Previous buffer"})
(map "i" "<C-l>" (cmd_string "bnext") { :desc "Next buffer"})
(map "v" "<C-h>" (cmd_string "bprevious") { :desc "Previous buffer"})
(map "v" "<C-l>" (cmd_string "bnext") { :desc "Next buffer"})

(map "n" "<leader>bc" (cmd_string "bdelete!") { :desc "Close buffer"})
(map "n" "<leader>bw" (cmd_string "bwipeout!") { :desc "Wipeout buffer"})

; Close floating windows
(fn close-floating []
  (each [_ win (ipairs (vim.api.nvim_list_wins))]
    (local config (vim.api.nvim_win_get_config win))
    (when (not= config.relative "") (vim.api.nvim_win_close win false))))

; Use q and <esc> to close floating windows and clear search
(map "n" "<esc>" (fn [] (close-floating) (vim.cmd "nohlsearch")))
(map "n" "q" (fn [] (close-floating) (vim.cmd "nohlsearch")))

; Exit visual mode without relying on <esc>
(fn exit-visual-mode []
  (vim.api.nvim_feedkeys (vim.api.nvim_replace_termcodes :<C-c> true false true) :x false))

; Use q and <esc> to close floating windows and clear search (in visual mode)
(map "v" "<esc>" (fn [] (close-floating) (vim.cmd "nohlsearch") (exit-visual-mode)))
(map "v" "q" (fn [] (close-floating) (vim.cmd "nohlsearch") (exit-visual-mode)))

; C+j and C+k to move up and down in menus
; BUG: This will open a completion menu even if cmp is already there
; SOLUTION: disable PUM set completeopt-=menuone,-menu,-preview (cmp still works)
(map ["i" "n" "c"] "<C-j>" "<C-n>" { :desc "Move down"})
(map ["i" "n" "c"] "<C-k>" "<C-p>" { :desc "Move up"})

; TODO: Code this in lua, so that the screen doesn't flicker
; - keybinds to reduce / increase indent
(map "v" "<" "<gv" { :desc "Reduce indent"})
(map "v" ">" ">gv" { :desc "Increase indent"})

; Tab is the same as C-i so we cant use it
;(map "n" "<tab>" ">>_" { :desc "Increase indent"})
;(map "n" "<s-tab>" "<<_" { :desc "Reduce indent"})
(map "i" "<S-tab>" "<C-D>" { :desc "Decrease indent"})
(map "v" "<tab>" ">gv" { :desc "Increase indent"})
(map "v" "<s-tab>" "<gv" { :desc "Reduce indent"})

; <leader>y (+y) to copy to system clipboard
(map "n" "<leader>y" "\"+y" { :desc "Copy (system)"})
(map "v" "<leader>y" "\"+y" { :desc "Copy (system)"})

; <leader>p to paste from system clipboard
(map "v" "<leader>p" "\"+p" { :desc "Paste (system)"}) 
(map "n" "<leader>p" "\"+p" { :desc "Paste (system)"})

; copy paste with Ctrl C and Ctrl V
;(map "v" "<C-c>" "\"+y" { :desc "Copy to system clipboard"}) ; BUG: C-c and esc are the same key :P 
;(map "n" "<C-v>" "\"+p" { :desc "Paste from system clipboard"}) TODO: Cant because visual block
(map "i" "<C-v>" "<C-o>\"+p" { :desc "Paste from system clipboard"})
(map "v" "<C-v>" "\"+p" { :desc "Paste from system clipboard"})

