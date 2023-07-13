---@type MappingsTable
local M = {}

M.general = {
  i = {
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<C-v>"] = { "<Esc>pa", "Paste" },
  },

  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<C-h>"] = { "", "Empty left" },
    ["<C-l>"] = { "", "Empty right" },
    ["<C-j>"] = { "", "Empty down" },
    ["<C-k>"] = { "", "Empty up" },
    ["<tab>"] = { "<C-i>", "go to next" },
    ["<C-n>"] = { "", "Empty down" },
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
  },

  v = {
    ["x"] = {"d", ""}
  }
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
      "Close other buffer",
    },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["gr"] = { "<cmd> Telescope lsp_references include_current_line=true fname_width=100 <CR>", "LSP references" },
    ["gi"] = { "<cmd> Telescope lsp_implementations include_current_line=true fname_width=100 <CR>", "LSP implementations" },

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

M.telescope = {
  n = {
    ["<C-t>"] = { "<cmd> Telescope resume <CR>", "resume Telescope" },
    ["<Space>fe"] = { "<cmd> Telescope diagnostics <CR>", "Show diagnostics" },
    ["<Space>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<Space>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<Space>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<Space>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<Space>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<Space>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<Space>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<Space>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
  },
}

M.nvimtree = {
  n = {
    -- toggle
    ["<F1>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<Space>ft"] = { "<cmd>NvimTreeFindFile<CR>", "Target file in tree" }, 
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fG"] = { "<cmd> Telescope grep_string <CR>", "Live grep cword" },
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
