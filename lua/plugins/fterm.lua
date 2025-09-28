return {
    {
        'numToStr/FTerm.nvim',
        config = function()
            require('FTerm').setup {
                border = 'double',
                cmd = 'zsh',
            }
            vim.keymap.set('n', '<C-t>', function()
                require('FTerm').toggle()
            end, { silent = true })
        end,
    },

    {
        'MunifTanjim/nui.nvim',
        dependencies = {'VonHeikemen/fine-cmdline.nvim'},
    }

}
