---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- toggle
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["gr"] = { "<cmd> Telescope lsp_references <CR>", "LSP references" },

    ["<leader>ld"] = { "<cmd> Telescope lsp_document_symbols <CR>", "file references" },
    ["<leader>lr"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "workspace references" },
    -- ["<leader>lR"] = { '<cmd> Telescope lsp_workspace_symbols query=<c-r><c-w><CR>', "find references" },
    ["<leader>lR"] = {
      function()
        local tagname = vim.fn.expand "<cword>"
        vim.cmd(string.format("Telescope lsp_workspace_symbols query=%s", tagname))
      end,
      "find references",
    },
  },
}

M.nvimtree = {
  n = {
    -- toggle
    ["<F1>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.symbolsoutline = {
  plugin = true,

  n = {
    -- toggle
    ["<F2>"] = { "<cmd>SymbolsOutline<CR>", "Toggle symbols outline" },
  },
}

-- more keybinds!

return M
