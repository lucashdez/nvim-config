return {
    { 'blazkowolf/gruber-darker.nvim' },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('rose-pine').setup {}
        end,
    },
    {
        'lucashdez/fleury_theme.nvim',
        priority = 1000,
        --config = function()
        --    require('fleury_theme').setup {}
        --end,
    },
    {
        'Shatur/neovim-ayu',
        config = function()
            require('ayu').setup {}
        end,
    },
    {
        'craftzdog/solarized-osaka.nvim',
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        'lucashdez/the-real-naysayer.nvim',
        name = 'naysayer',
        lazy = false,
        config = function()
            require('naysayer').setup {
                variant = 'main',
                dark_variant = 'main',
                bold_vert_split = false,
                dim_nc_background = false,
                disable_background = true,
                disable_float_background = true,
                disable_italics = true,
            }
        end,
    },
    {
        'lucashdez/4coder-theme',
        config = function()
            require('4coder-theme').setup {}
        end,
    },
    {
        'CodeGradox/onehalf-lush',
        name = 'onehalf',
        priority = 1000,
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
    },
    {
        'rebelot/kanagawa.nvim',
        name = 'kanagawa',
        priority = 1000,
        config = function()
            require('kanagawa').setup {
                commentStyle = { italic = false },
                transparent = false,
                -- keywordStyle = { italic = false},
                -- statementStyle = { bold = true },
            }
            vim.cmd 'highlight LineNr guibg=NONE guifg=#a0a0a0'
        end,
    },
    {
        'maxmx03/dracula.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            ---@type dracula
            local dracula = require 'dracula'
            dracula.setup {
                transparent = false,
                on_colors = function(colors, color)
                    ---@type dracula.palette
                    return {
                        -- override or create new colors
                        mycolor = '#ffffff',
                    }
                end,
                on_highlights = function(colors, color)
                    ---@type dracula.highlights
                    return {
                        ---@type vim.api.keyset.highlight
                        Normal = { fg = colors.mycolor },
                    }
                end,
                plugins = {
                    ['nvim-treesitter'] = true,
                    ['nvim-lspconfig'] = true,
                    ['nvim-navic'] = true,
                    ['nvim-cmp'] = true,
                    ['indent-blankline.nvim'] = true,
                    ['neo-tree.nvim'] = true,
                    ['nvim-tree.lua'] = true,
                    ['which-key.nvim'] = true,
                    ['dashboard-nvim'] = true,
                    ['gitsigns.nvim'] = true,
                    ['neogit'] = true,
                    ['todo-comments.nvim'] = true,
                    ['lazy.nvim'] = true,
                    ['telescope.nvim'] = true,
                    ['noice.nvim'] = true,
                    ['hop.nvim'] = true,
                    ['mini.statusline'] = true,
                    ['mini.tabline'] = true,
                    ['mini.starter'] = true,
                    ['mini.cursorword'] = true,
                },
            }
        end,
    },
    {
        'AlexvZyl/nordic.nvim',
        name = 'nordic',
        lazy = false,
        priority = 1000,
        config = function() end,
    },
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000,
        config = function()
            require('gruvbox').setup {
                contrast = 'hard',
            }
        end,
    },
    {
        'miikanissi/modus-themes.nvim',
        priority = 1000,
        config = function()
            require('modus-themes').setup {
                style = 'modus_vivendi',
                variant = 'deuteranopia',
            }
        end,
    },
}
