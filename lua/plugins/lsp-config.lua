return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
        version = "^1.0.0",
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
        version = "^1.0.0"
    },
    {
        'neovim/nvim-lspconfig',
        opts = { servers = { zls = { init_options = { provideFormatter = false } } } },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require 'lspconfig'

            lspconfig.lua_ls.setup {
                capabilities = capabilities,
            }
            lspconfig.html.setup {
                capabilities = capabilities,
            }
            lspconfig.cssls.setup {
                capabilities = capabilities,
            }

            lspconfig.ts_ls.setup {
                capabilities = capabilities,
            }
            lspconfig.rust_analyzer.setup {
                capabilities = capabilities,
            }

            lspconfig.jdtls.setup {
                capabilities = capabilities,
            }

            lspconfig.csharp_ls.setup {
                capabilities = capabilities,
            }

            lspconfig.clangd.setup {
                capabilities = capabilities,
            }

            lspconfig.angularls.setup {
                capabilities = capabilities,
            }

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end,
    },
}
