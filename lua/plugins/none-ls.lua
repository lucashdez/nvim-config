return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua.with({
                    extra_args = { '--tab-width 4' }
                }),
                null_ls.builtins.formatting.prettier.with({
                    extra_args = { '--tab-width 1' }
                }),
            },
        })

        vim.keymap.set("n", "<leader>af", vim.lsp.buf.format, {})
    end,
}
