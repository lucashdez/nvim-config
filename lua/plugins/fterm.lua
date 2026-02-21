return {
    {
        'numToStr/FTerm.nvim',
        config = function()
            local cmd_shell = 'zsh'
            local is_windows = package.config:sub(1,1) == "\\"
            if is_windows then
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
}
