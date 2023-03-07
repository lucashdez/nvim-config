local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.formatting.prettierd.with({
			extra_args = {
				"--tab-width=4",
			},
		}),
		null_ls.builtins.diagnostics.fish,

		--CODE ACTIONS
		null_ls.builtins.code_actions.ltrs,

		--LINTER
		null_ls.builtins.diagnostics.ltrs,

		--FORMAT
		null_ls.builtins.formatting.rustfmt.with({
			extra_args = {
				"--edition=2021",
				"--config",
				"chain_width=60,imports_layout=Vertical,wrap_comments=true,max_width=80,error_on_line_overflow=true",
			},
		}),
		null_ls.builtins.formatting.clang_format.with({
			extra_args = {
				"--style",
				"{ IndentWidth: 4, TabWidth: 4, BreakBeforeBraces: Allman, AlwaysBreakAfterReturnType: TopLevelDefinitions, IndentCaseLabels: true}",
			},
		}),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.csharpier,
		null_ls.builtins.formatting.blue,
		--------------
	},

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})

vim.api.nvim_create_user_command("DisableLspFormatting", function()
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
