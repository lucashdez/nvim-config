return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup {
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')
                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end
                    map('n', '<Space>b', function()
                        gitsigns.blame_line({ full = false })
                    end)
                end,
                preview_config = {
                    border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }
                }
            }
        end

    }
}
