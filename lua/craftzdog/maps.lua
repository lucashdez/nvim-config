local keymap = vim.keymap

keymap.set("n", "x", '"_x')

--Terminal horizontal/vertical
keymap.set("n", ";th", ":botright new <Bar> :terminal<CR>")
keymap.set("n", ";tv", ":botright vnew <Bar> :terminal<CR>")
vim.cmd([[
tnoremap <silent> <Esc> <C-\><C-n>
]])
-- Save/Quit
keymap.set("n", ";w", "<Cmd>w<CR>")
keymap.set("n", ";q", "<Cmd>q<CR>")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set("n", ";te", ":tabedit")
-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")
-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
--keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("", "<C-w><", ":vertical resize +5<CR>")
keymap.set("", "<C-w>>", ":vertical resize -5<CR>")
keymap.set("", "<C-w>+", ":resize +5<CR>")
keymap.set("", "<C-w>-", ":resize -5<CR>")

--CONJURE COMMANDS

keymap.set("n", ";eb", "<Cmd>ConjureEvalBuf<CR>")
keymap.set("n", ";ee", "<Cmd>ConjureEvalCurrentForm<CR>")
keymap.set("n", ";er", "<Cmd>ConjureEvalRootForm<CR>")
keymap.set("n", ";e!", "<Cmd>ConjureEvalReplaceForm<CR>")
keymap.set("n", ";em", "<Cmd>ConjureEvalMarkedForm<CR>")
keymap.set("n", ";E", "<Cmd>ConjureEvalVisual<CR>")
keymap.set("n", ";Eiw", "<Cmd>ConjureEvalWord<CR>")

keymap.set("n", ";ls", "<Cmd>ConjureLogSplit<CR>")
keymap.set("n", ";lv", "<Cmd>ConjureLogVSplit<CR>")
keymap.set("n", ";lt", "<Cmd>ConjureLogTab<CR>")
keymap.set("n", ";lr", "<Cmd>ConjureLogResetSoft<CR>")
keymap.set("n", ";lR", "<Cmd>ConjureLogResetHard<CR>")

-- FASTSEARCH
keymap.set("n", ";s", "/")
keymap.set("n", ";g", "<Cmd>noh<CR>")

-- TODO COMMENTS
keymap.set("n", ";td", "<Cmd>TODOTelescope<CR>")

-- NO ARROWS
keymap.set("n", "<Up>", "<Nop>")
keymap.set("n", "<Down>", "<Nop>")
keymap.set("n", "<Left>", "<Nop>")
keymap.set("n", "<Right>", "<Nop>")

-- GIT
keymap.set("n", ";gv", "<Cmd>Gvdiffsplit<CR>")
keymap.set("n", ";gh", "<Cmd>Ghdiffsplit<CR>")
keymap.set("n", ";gg", ":Git ")

-- FOLD
keymap.set("n", ";<Space>", "za")
-- Comfy Esc
keymap.set("i", "<C-k>", "<Esc>")
keymap.set("v", "<C-k>", "<Esc>")
-- Movement
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")
keymap.set("n", "j", "jzz")
keymap.set("n", "k", "kzz")
keymap.set("n", "G", "Gzz")
keymap.set("n", "gg", "ggzz")
