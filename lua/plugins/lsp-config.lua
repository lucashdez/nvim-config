return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
        version = "^1.0.0",
    },
    {

        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        opts = { bind = true, handler_opts = { border = 'rounded' } },
        config = function()
            require('lsp_signature').setup({})
        end

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
        'ray-x/lsp_signature.nvim',
        event = 'InsertEnter',
        config = function ()
            require('lsp_signature').setup {}
        end
        

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
                cmd = { 'rust-analyzer' },
                capabilities = capabilities,
            }

            lspconfig.jdtls.setup {
                capabilities = capabilities,
            }

            local omnisharp_location =
            'C:/Users/lhernandezabreu/AppData/Local/nvim-data/mason/packages/omnisharp/OmniSharp.cmd'
            lspconfig.omnisharp.setup {
                capabilities = capabilities,
                cmd = { omnisharp_location },
            }


            lspconfig.clangd.setup {
                capabilities = capabilities,
            }

            lspconfig.angularls.setup {
                capabilities = capabilities,
            }

            lspconfig.zls.setup {
                capabilities = capabilities,
            }

            local _border = "rounded"
            local function bordered_hover(_opts)
                _opts = _opts or {}
                return vim.lsp.buf.hover(vim.tbl_deep_extend("force", _opts, {
                    border = _border
                }))
            end


            vim.keymap.set('n', 'K', bordered_hover, {})

            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end,
    },
}
