local function lua_cmd_string(s)
  return "<cmd>lua " .. s .. "<cr>"
end


return {
  "echasnovski/mini.move",
  opts = {
    -- TODO: figure out which mappings to use that do not conflict with popup menus, or tmux (no alt)
    -- mappings = {
    --   -- visual
    --   left = "<C-h>",
    --   right = "<C-l>",
    --   down = "<C-j>",
    --   up = "<C-k>",
    --   -- normal
    --   line_left = "<C-h>",
    --   line_right = "<C-l>",
    --   word_left = "<C-h>",
    --   word_right = "<C-l>",
    -- }
  },
  keys = {
    { "<Tab>",   lua_cmd_string("MiniMove.move_line('right')"), noremap = true, },
    { "<S-Tab>", lua_cmd_string("MiniMove.move_line('left')"),  noremap = true, },
    -- Handled by keymaps.lua
    -- { "<Tab>",   lua_cmd_string("MiniMove.move_line('right')"), mode = "v",     noremap = true, },
    -- { "<S-Tab>", lua_cmd_string("MiniMove.move_line('left')"),  mode = "v",     noremap = true, },
  },
}
