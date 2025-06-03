return {
    'zaldih/themery.nvim',
    config = function()
        require('themery').setup {
            themes = {
                '4coder-theme',
                'ayu',
                'catppuccin-frappe',
                'catppuccin-latte',
                'catppuccin-macchiato',
                'catppuccin-mocha',
                'dracula',
                'dracula-soft',
                'gruber-darker',
                'gruvbox',
                'kanagawa-dragon',
                'kanagawa-lotus',
                'kanagawa-wave',
                'modus_vivendi',
                'naysayer',
                'nordic',
                'onehalf-lush',
                'onehalf-lush-dark',
                'solarized-osaka',
                'solarized-osaka-day',
                'solarized-osaka-moon',
                'solarized-osaka-night',
                'solarized-osaka-storm',
            },
            livePreview = true,
        }
        vim.keymap.set('n', '<leader>T', ':Themery<CR>', {})

        -- Themery block
        -- This block will be replaced by Themery.
        vim.cmd 'colorscheme ayu'
        vim.g.theme_id = 3
        -- end themery block
    end,
}
