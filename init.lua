local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=main", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("vim-options")
require("lazy").setup("plugins")


if vim.g.neovide then
    vim.g.neovide_opacity = 0.85
    vim.g.neovide_cursor_animation_length = 0.05
end

vim.cmd [[let g:zig_fmt_autosave = 0]]
