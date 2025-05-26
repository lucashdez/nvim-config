return {
    'numToStr/FTerm.nvim',
    config = function()
        require('FTerm').setup {
            border = 'double',
            cmd = 'nu',
        }
        vim.keymap.set('n', '<C-t>', function()
            require('FTerm').toggle()
        end, { silent = true })
    end,
}
