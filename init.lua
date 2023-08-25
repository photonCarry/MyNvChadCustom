-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.colorcolumn='120'

-- 显示空白符号
vim.cmd("set list") -- 关闭： set nolist
vim.cmd("set lcs+=space:·")

vim.g.mapleader = ","

require('custom.filetypes')
