require("bufferline").setup({
	options = {
		mode = "buffers",
		numbers = "ordinal",
		numer_style = "subscript",
		close_command = "bdelete! %d",
		indicator_style = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		name_formatter = function(buf)
			if buf.name:match("%.md") then
				return vim.fn.fnamemodify(buf.name, ":t:r")
			end
		end,
		max_name_length = 12,
		max_prefix_length = 15,
		tab_size = 12,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, errors, ctx)
			return "(" .. count .. ")"
		end,
	},
})
