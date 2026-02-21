vim.cmd 'set expandtab'
vim.cmd 'set tabstop=4'
vim.cmd 'set softtabstop=4'
vim.cmd 'set shiftwidth=4'
vim.cmd 'set noswapfile'
vim.cmd 'set number'
vim.cmd 'set cindent'
vim.cmd 'set cinoptions=2'
vim.cmd 'set fillchars=eob:\\ '
vim.cmd 'tnoremap <S-Esc> <C-\\><C-n>'
vim.cmd 'set grepprg=rg\\ '
vim.cmd 'set grepformat^=%f:%l:%c:%m'

vim.keymap.set('n', '<C-c><C-a>', ':OrgSuperAgenda<CR>', { silent = true })

-- redo
vim.keymap.set('n', 'U', '<C-r>', {})

-- ctrl keymaps
vim.keymap.set('n', '<C-z>', 'u', {})
vim.keymap.set('n', '<C-y>', '"+yy', {})
vim.keymap.set('v', '<C-y>', '"+y', {})
vim.keymap.set({ 'n', 'v' }, '<C-p>', '"+p', {})
vim.keymap.set('n', '<C-P>', '"+P', {})
vim.keymap.set('n', ',', ':vsplit<CR>', { silent = true })
vim.keymap.set('n', '-', ':split<CR>', { silent = true })
vim.keymap.set('n', '<C-,>', '<C-w><C-w>', {})
vim.keymap.set('n', '<C-S-P>', ':close<CR>', { silent = true })
vim.keymap.set('n', '<C-Tab>', ':tabn<CR>', { silent = true })
vim.keymap.set('n', '<C-S-Tab>', ':tabp<CR>', { silent = true })

-- Change movements (jk) to their "go" version
vim.keymap.set({ 'n', 'v' }, 'j', 'gj', {})
vim.keymap.set({ 'n', 'v' }, 'k', 'gk', {})
vim.keymap.set({ 'n', 'v' }, 'gb', '[{', {})
vim.keymap.set({ 'n', 'v' }, 'ge', ']}', {})

vim.g.mapleader = ' '
vim.opt.relativenumber = true

local function insert_special_comment(comment)
	local username = 'lucashdez'
	local comment_fmt = vim.o.commentstring
	local indent = vim.fn.indent '.'
	local tab_width = vim.o.tabstop
	local indent_str = string.rep('\t', indent / tab_width)
	local comment_with_marker =
		string.format(comment_fmt, comment .. '(' .. username .. '): |')
	local cursor_pos_x = string.find(comment_with_marker, '|') + indent
	local clean_comment = indent_str
		.. string.gsub(comment_with_marker, '|', ' ')

	if clean_comment then
		vim.api.nvim_put({ clean_comment }, 'l', false, true)
		local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
		vim.api.nvim_win_set_cursor(0, { row - 1, cursor_pos_x + 1 })
		vim.cmd [[startinsert]]
	end
end

vim.keymap.set('n', '<leader>ct', function()
	insert_special_comment 'TODO'
end, { silent = true })

vim.keymap.set('n', '<leader>cy', function()
	insert_special_comment 'NOTE'
end, { silent = true })

vim.keymap.set('n', '<leader>cs', function()
	insert_special_comment 'SAFETY'
end, { silent = true })

-- C#
-- Document Class
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'cs',
	callback = function()
		vim.keymap.set('n', '<Space>dc', function()
			local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
			local lines = {
				'/// <summary>',
				'/// ',
				'/// </summary>',
			}

			vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, lines)
			vim.api.nvim_win_set_cursor(0, { row + 1, 4 })
			vim.cmd 'startinsert'
		end, { desc = 'Insert C# XML summary' })
	end,
})

-- Document Function
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'cs',
	callback = function()
		vim.keymap.set('n', '<Space>df', function()
			local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
			local lines = {
				'/// <summary>',
				'/// ',
				'/// <param name = ""> </param>',
				'/// </summary>',
			}

			vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, lines)
			vim.api.nvim_win_set_cursor(0, { row + 1, 16 })
			vim.cmd 'startinsert'
		end, { desc = 'Insert C# XML summary' })
	end,
})
