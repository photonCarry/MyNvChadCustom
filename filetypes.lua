local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.tabstop=2
    vim.opt_local.softtabstop=2
    vim.opt_local.shiftwidth=2
  end,
})
