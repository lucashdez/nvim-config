-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.cmd([[highlight myCursor guifg=black guibg=lime]])
vim.opt.guicursor = { "n:block-myCursor,v-c:block-myCursor,i:ver100-myCursor" }
