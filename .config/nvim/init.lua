-- ~/.config/nvim/init.lua

-- set var
local opt = vim.opt
local api = vim.api

-- general
opt.number = true
opt.mouse = "a"

-- need to figure out my clipboard provider
--opt.clipboard = "unnamedplus"

-- indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.autoindent = true
opt.smartindent = true -- I still have no idea what this does, but everyone hates it for yaml

-- set specific settings for yaml
api.nvim_create_autocmd("FileType", {
    pattern = { "yaml", "yml" },
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.indentkeys:remove(".") -- avoid indent jumps after dots/dashes
    end,
})

