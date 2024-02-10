-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.g.maplocalleader = ";"

-- Back to normal
keymap.set("i", "<C-k>", "<Esc>")
keymap.set("v", "<C-k>", "<Esc>")

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
keymap.set("n", "<Space>ss", ":split<Return><C-w>w")
keymap.set("n", "<Space>sv", ":vsplit<Return><C-w>w")

-- Movement
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")
keymap.set("n", "j", "jzz")
keymap.set("n", "k", "kzz")
keymap.set("n", "G", "Gzz")
keymap.set("n", "gg", "ggzz")
keymap.set("n", "<C-j>", "}zz")
keymap.set("n", "<C-k>", "{zz")
-- Bdelete
keymap.set("n", "<S-q>", "<Cmd>bdelete!<CR>")