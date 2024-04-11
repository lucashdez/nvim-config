-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.treesitter.language.register("sqls", "sqls")

vim.filetype.add({
    extension = {
        sqls = "sqls",
    },
    pattern = {
        [".*.sqls"] = "sqls",
    },
})
