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

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set("n", "te", ":tabedit")
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
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

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
keymap.set("n", ";td", "<Cmd>TodoTelescope<CR>")
