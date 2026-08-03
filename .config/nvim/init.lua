-- ~/.config/nvim/init.lua

-- set vars
local opt = vim.opt
local api = vim.api
local keymap = vim.keymap

-- general
opt.number = true
opt.mouse = "a"

-- figure out clipboard provider before enabling 
opt.clipboard = "unnamedplus"

-- indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.autoindent = true
opt.smartindent = true -- I still have no idea what this does, but everyone hates it for yaml

-- keybinds
-- keymap.set()
keymap.set("i", "jk", "<Esc>", { desc = "Escape to normal mode"})

keymap.set("x", "cc", ":s/^/#/<CR>", { desc = "Comment line" })
keymap.set("x", "cx", ":s/^#//<CR>", { desc = "Uncomment line" })

--- setup split view controls
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

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

