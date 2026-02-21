return {
	{
		'j-hui/fidget.nvim',
		opts = {},
		config = function()
			local fidget = require 'fidget'
			vim.notify = fidget.notify
		end,
	},
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup {
				registries = {
					'github:mason-org/mason-registry',
					'github:Crashdummyy/mason-registry',
				},
			}
		end,
	},
	{

		'ray-x/lsp_signature.nvim',
		event = 'InsertEnter',
		opts = { bind = true, handler_opts = { border = 'rounded' } },
		config = function()
			require('lsp_signature').setup {}
		end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup {
				ensure_installed = {
					'lua_ls',
					'cssls',
					'html',
				},
			}
		end,
	},
	{
		'ray-x/lsp_signature.nvim',
		event = 'InsertEnter',
		config = function()
			require('lsp_signature').setup {}
		end,
	},
	{
		'seblyng/roslyn.nvim',
		opts = {
			ft = { 'cs', 'csproj' },
			filewatching = 'auto',
			broad_search = true,
		},
	},
	{
		'neovim/nvim-lspconfig',
		opts = {
			servers = { zls = { init_options = { provideFormatter = false } } },
		},
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			vim.diagnostic.config {
				virtual_text = {
					spacing = 2,
					severity = { min = vim.diagnostic.severity.HINT }, -- todo excepto disabled
					prefix = '●',
				},
				signs = true,
				underline = true,
			}

			vim.filetype.add {
				extension = {
					razor = 'razor',
					cshtml = 'razor',
				},
			}
			local roslyn_path =
				'C:/Users/lhernandezabreu/AppData/Local/nvim-data/mason/packages/roslyn-unstable/'
			local razor_extension_path = roslyn_path
				.. 'libexec/.razorExtension/'

			vim.lsp.config('roslyn', {
				capabilities = capabilities,
				on_attach = function(client, _)
					client.server_capabilities.diagnosticProvider =
						{ workspaceDiagnostics = true }
					print '[Roslyn] Attached'
				end,
				filetypes = { 'cs', 'cshtml', 'razor' },
				cmd = {
					roslyn_path .. 'roslyn.cmd',
					'--logLevel',
					'Information',
					'--extensionLogDirectory',
					vim.fs.dirname(vim.lsp.log.get_filename()),
					'--razorSourceGenerator',
					razor_extension_path
						.. 'Microsoft.CodeAnalysis.Razor.Compiler.dll',
					'--razorDesignTimePath',
					razor_extension_path
						.. 'Targets/Microsoft.NET.Sdk.Razor.DesignTime.targets',
					'--extension',
					razor_extension_path
						.. 'Microsoft.VisualStudioCode.RazorExtension.dll',
					'--stdio',
				},

				settings = {
					['csharp|background_analysis'] = {
						dotnet_analyzer_diagnostics_scope = 'fullSolution',
						dotnet_compiler_diagnostics_scope = 'fullSolution',
					},
				},
			})
			vim.lsp.enable 'roslyn'

			local handles = {}
			vim.api.nvim_create_autocmd('User', {
				pattern = 'RoslynRestoreProgress',
				callback = function(ev)
					local token = ev.data.params[1]
					local handle = handles[token]
					if handle then
						handle:report {
							title = ev.data.params[2].state,
							message = ev.data.params[2].message,
						}
					else
						handles[token] =
							require('fidget.progress').handle.create {
								title = ev.data.params[2].state,
								message = ev.data.params[2].message,
								lsp_client = {
									name = 'roslyn',
								},
							}
					end
				end,
			})

			vim.api.nvim_create_autocmd('User', {
				pattern = 'RoslynRestoreResult',
				callback = function(ev)
					local handle = handles[ev.data.token]
					handles[ev.data.token] = nil

					if handle then
						handle.message = ev.data.err and ev.data.err.message
							or 'Restore completed'
						handle:finish()
					end
				end,
			})

			vim.lsp.enable 'lua_ls'
			vim.lsp.config('lua_ls', {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
						},
						diagnostics = {
							globals = { 'vim' }, -- Ensure 'vim' is recognized globally
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file('', true),
						},
					},
				},
			})

			-- lspconfig.html.setup {
			--     capabilities = capabilities,
			-- }
			-- lspconfig.cssls.setup {
			--     capabilities = capabilities,
			-- }
			--
			-- lspconfig.ts_ls.setup {
			--     capabilities = capabilities,
			-- }
			-- lspconfig.rust_analyzer.setup {
			--     cmd = { 'rust-analyzer' },
			--     capabilities = capabilities,
			-- }
			vim.lsp.enable 'rust_analyzer'
			vim.lsp.config('rust_analyzer', {
				capabilities = capabilities,
			})
			-- lspconfig.jdtls.setup {
			--     capabilities = capabilities,
			-- }
			--
			vim.lsp.enable 'clangd'
			vim.lsp.config('clangd', { capabilities = capabilities })

			-- lspconfig.angularls.setup {
			--     capabilities = capabilities,
			-- }
			--
			-- lspconfig.zls.setup {
			--     capabilities = capabilities,
			-- }
			--
			vim.lsp.config('html', {
				filetypes = { 'html' },
				settings = {
					html = {
						validate = {
							-- evita error de validProperties en Razor
							styles = false,
							scripts = false,
						},
					},
					css = {
						validate = false,
					},
					javascript = {
						validate = false,
					},
				},
			})
			vim.lsp.enable 'html'

			local _border = 'rounded'
			local function bordered_hover(_opts)
				_opts = _opts or {}
				return vim.lsp.buf.hover(vim.tbl_deep_extend('force', _opts, {
					border = _border,
				}))
			end

			vim.keymap.set({ 'n' }, 'K', bordered_hover, {})
			vim.keymap.set(
				{ 'n' },
				'<Space>wd',
				vim.lsp.buf.workspace_diagnostics,
				{ silent = true }
			)

			vim.keymap.set({ 'n' }, 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({ 'n' }, '<F2>', vim.lsp.buf.rename, {})
			vim.keymap.set(
				{ 'n', 'v' },
				'<leader>ca',
				vim.lsp.buf.code_action,
				{}
			)
		end,
	},
}
