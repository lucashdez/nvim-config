return {
    -- Vim Fugitive
    {
        "tpope/vim-fugitive",
    },

    -- Gitsigns
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
    },
    {
        "itchyny/calendar.vim",
    },
}
