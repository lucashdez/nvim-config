-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- Back to normal
keymap.set("i", "<C-l>", "<Esc>", opts)
keymap.set("v", "<C-l>", "<Esc>", opts)

-- Windows
--
-- Terminal horizontal/vertical
keymap.set("n", "<Localleader>th", ":botright new <Bar> :terminal<CR>")
keymap.set("n", "<Localleader>tv", ":botright vnew <Bar> :terminal<CR>")
vim.cmd([[
tnoremap <silent> <C-k> <C-\><C-n>
]])
-- Save/Quit
keymap.set("n", "<Localleader>w", "<Cmd>w<CR>")
keymap.set("n", "<Localleader>q", "<Cmd>q<CR>")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
-- New tab
keymap.set("n", "<Leader>te", ":tabedit<CR>")
-- Split window
keymap.set("n", "<Localleader>ss", ":split<Return><C-w>w")
keymap.set("n", "<Localleader>sv", ":vsplit<Return><C-w>w")

-- Movement
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")
keymap.set("n", "G", "Gzz")
keymap.set("n", "gg", "ggzz")
-- Bdelete
keymap.set("n", "<S-q>", "<Cmd>bdelete!<CR>")

-- Diagnostics
keymap.set("n", "<S-d>", function()
    vim.diagnostic.goto_next()
end)

-- TSGroup
keymap.set("n", "<Leader>ti", function()
    local result = vim.treesitter.get_captures_at_cursor(0)
    print(vim.inspect(result))
end)

-- Nabla
local nabla_virt = false
keymap.set("n", "<Leader>n", function()
    local nabla = require("nabla")
    if nabla_virt then
        nabla.disable_virt()
        nabla_virt = false
    else
        nabla.enable_virt()
        nabla_virt = true
    end
end)
