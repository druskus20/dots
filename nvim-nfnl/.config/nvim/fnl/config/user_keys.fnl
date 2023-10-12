
; Loaded on "VeryLazy" event. Only user keys. Plugin-specific keys
; should be configured on it's respective plugin spec so that which-key can
; pick them up (with a "desc" property).
; Which-key keys or groups should be configured in which_key.fnl. 


; disable command history
; (vim.keymap.set :n "q:" ":q") ; creates a "wait time" if we plan to use q as quit
; remap q (record macro) to Q

(local {: autoload} (require :nfnl.module))

(vim.keymap.set :n "q" "<Nop>")
(vim.keymap.set :n "Q" "q")

; TODO: improve
(local util (autoload :util))
(local map util.safe_keymap_set)

; For which key keybinds
; (fn cmd [s desc] [(.. "<cmd>" s "<cr>") desc])
; (fn sel-cmd [s desc] [(.. "<cmd>'<,'>" s "<cr>") desc])

(fn cmd_string [s] (.. "<cmd>" s "<cr>")) ; TODO: Change

; TODO: Funny macro / function  that accepts a table with maps, similar to wk.register
; (alternatively I could just require wk, now that keybinds are ALWAYS lazy loaded)
(map "n" "<leader>l" (cmd_string "bprevious") { :desc "Previous buffer"})
(map "n" "<leader>h" (cmd_string "bnext") { :desc "Next buffer"})
(map "n" "<leader>h" (cmd_string "bnext") { :desc "Next buffer"})
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

; TODO: 
; - keybinds to reduce / increase indent
; - keybinds to move lines up and down

