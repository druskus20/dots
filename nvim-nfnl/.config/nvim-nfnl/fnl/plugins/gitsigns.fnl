[{1 :lewis6991/gitsigns.nvim
  ;:event :LazyFile ; TODO: Custom event https://github.com/LazyVim/LazyVim/blob/1e7924878693be1570c91811fd5c55bb53c8c4d0/lua/lazyvim/util/plugin.lua#L70
  :event :VeryLazy
  :opts {:on_attach (fn [buffer]
                      (local gs package.loaded.gitsigns)
                      (fn map [mode l r desc]
                        (vim.keymap.set mode l r {: buffer : desc}))
                      (map :n "]h" gs.next_hunk "Next Hunk")
                      (map :n "[h" gs.prev_hunk "Prev Hunk")
                      (map [:n :v] :<leader>ghs ":Gitsigns stage_hunk<CR>"
                           "Stage Hunk")
                      (map [:n :v] :<leader>ghr ":Gitsigns reset_hunk<CR>"
                           "Reset Hunk")
                      (map :n :<leader>ghS gs.stage_buffer "Stage Buffer")
                      (map :n :<leader>ghu gs.undo_stage_hunk "Undo Stage Hunk")
                      (map :n :<leader>ghR gs.reset_buffer "Reset Buffer")
                      (map :n :<leader>ghp gs.preview_hunk "Preview Hunk")
                      (map :n :<leader>ghb (fn [] (gs.blame_line {:full true}))
                           "Blame Line")
                      (map :n :<leader>ghd gs.diffthis "Diff This")
                      (map :n :<leader>ghD (fn [] (gs.diffthis "~"))
                           "Diff This ~")
                      (map [:o :x] :ih ":<C-U>Gitsigns select_hunk<CR>"
                           "GitSigns Select Hunk"))
         :signs {:add {:text "▎"}
                 :change {:text "▎"}
                 :changedelete {:text "▎"}
                 :delete {:text ""}
                 :topdelete {:text ""}
                 :untracked {:text "▎"}}}}]

