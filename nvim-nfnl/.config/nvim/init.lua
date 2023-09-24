-- 1) loads lazy: https://github.com/LazyVim/starter/blob/main/lua/config/lazy.lua
-- 2) lazy.nvim import. reloads lazy https://github.com/lazyvim/lazyvim/blob/a72a84972d85e5bbc6b9d60a0983b37efef21b8a/lua/lazyvim/plugins/core.lua
-- 3) require: https://github.com/LazyVim/LazyVim/blob/a72a84972d85e5bbc6b9d60a0983b37efef21b8a/lua/lazyvim/config/init.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local fn = vim.fn
    fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

-- vim.loader.enable() -- already there: https://github.com/folke/lazy.nvim/blob/2a9354c7d2368d78cbd5575a51a2af5bd8a6ad01/lua/lazy/init.lua#L38

vim.opt.runtimepath:prepend(lazypath)

function recompile()
    local cwd = vim.fn.getcwd()
    vim.cmd("cd " .. vim.fn.stdpath("config"))
    -- delete
    vim.fn.delete(vim.fn.stdpath("config") .. "/lua", "rf")
    require('nfnl')['compile-all-files']()
    vim.cmd("cd " .. cwd)
end

-- vim recompile command
vim.cmd("command! Recompile lua recompile()")

-- on first run, install lazy.nvim and compile plugins, otherwise just load plugins
if (vim.fn.isdirectory(vim.fn.stdpath("config") .. "/lua/plugins") == 0) then
    require("lazy").setup({ { "Olical/nfnl" } })
    recompile()
    print("Exit and restart neovim")
    -- wait for user input and exit
    vim.defer_fn(function()
        vim.cmd("qa")
    end, 1)
else
    require("lazy").setup({
        {
            "Olical/nfnl",
            ft = "fennel",
            dependencies = { "norcalli/nvim.lua" }
        },
        { import = "plugins" }
    })
end


