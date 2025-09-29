return {
    {
        'numToStr/FTerm.nvim',
        config = function()
            local cmd_shell = 'zsh'
            if vim.fn.has("win32") then
                cmd_shell = "nu"
            end 
            require('FTerm').setup {
                border = 'double',
                cmd = cmd_shell,
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
