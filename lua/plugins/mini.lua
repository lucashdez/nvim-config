return {
    { 'echasnovski/mini.nvim', version = '*' },
    {
        'echasnovski/mini.align',
        version = '*',
        config = function()
            require('mini.align').setup()
        end,
    },
    {
        'echasnovski/mini.indentscope',
        version = '*',
        config = function()
            require('mini.indentscope').setup {
                symbol = '│',
            }
        end,
    },
}
