; Loaded on "VeryLazy" event. Only user keys. Plugin-specific keys
; should be configured on it's respective plugin spec so that which-key can
; pick them up (with a "desc" property).


; disable command history
; (vim.keymap.set :n "q:" ":q") ; creates a "wait time" if we plan to use q as quit
; remap q (record macro) to Q
(vim.keymap.set :n "q" "<Nop>")
(vim.keymap.set :n "Q" "q")
