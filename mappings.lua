---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<C-h>"] = { "", "Empty left" },
    ["<C-l>"] = { "", "Empty right" },
    ["<C-j>"] = { "", "Empty down" },
    ["<C-k>"] = { "", "Empty up" },
  },
}

M.tabufline = {
  n = {
    ["<leader>b"] = { "", "buffer" },
    ["<leader>bb"] = { "<cmd> enew <CR>", "New buffer" },
    -- close buffer + hide terminal buffer
    ["<leader>bx"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close current buffer",
    },
    ["<leader>bo"] = {
      function()
        require("nvchad_ui.tabufline").closeOtherBufs()
      end,
      "Close current buffer",
    },
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
    ["<leader>ft"] = { "<cmd>NvimTreeFindFile<CR>", "Target file in tree" }, 
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
