return {
    'zaldih/themery.nvim',
    config = function()
        require('themery').setup {
            themes = {
                'catppuccin-frappe',
                'catppuccin-macchiato',
                'catppuccin-mocha',
                'catppuccin-latte',
                'dracula',
                'dracula-soft',
                'gruvbox',
                'kanagawa-wave',
                'kanagawa-dragon',
                'kanagawa-lotus',
                'modus_vivendi',
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
        vim.cmd 'colorscheme modus_vivendi'
        vim.g.theme_id = 3
        -- end themery block
    end,
}
