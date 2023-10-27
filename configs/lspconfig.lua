local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "gopls", "marksman", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}

-- util = require "lspconfig/util"
-- lspconfig.gopls.setup {
--   cmd = {"gopls", "serve"},
--   filetypes = {"go", "gomod"},
--   root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--   settings = {
--     gopls = {
--       analyses = {
--         unusedparams = true,
--       },
--       staticcheck = true,
--     },
--   },
-- }

vim.g.go_def_mode='gopls'
vim.g.go_info_mode='gopls'

-- go保存时自动import
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})

vim.g.vista_sidebar_position = "vertical botright"
vim.g.vista_default_executive = 'nvim_lsp'
-- vim.g.vista_fzf_preview = ['right:50%']
vim.g.vista_sidebar_width = 50

-- 切换tab
local function buffline_opts(desc)
  return { desc = desc }
end
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format(",%s", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end, buffline_opts(string.format("Jump to buffer %s", i)))
end
