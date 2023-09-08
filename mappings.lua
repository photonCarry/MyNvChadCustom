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
    ["<leader>t2"] = {
      function()
        vim.opt_local.tabstop=2
        vim.opt_local.softtabstop=2
        vim.opt_local.shiftwidth=2
      end, "set tabstop=2" },
    ["<leader>t4"] = {
      function()
        vim.opt_local.tabstop=4
        vim.opt_local.softtabstop=4
        vim.opt_local.shiftwidth=4
      end, "set tabstop=2" },
  },

  v = {
    ["x"] = {"d", ""}
  }
}

-- 历史原因，C-/没法被映射
-- M.comment = {
--   -- toggle comment in both modes
--   n = {
--     ["<C-/>"] = {
--       function()
--         require("Comment.api").toggle.linewise.current()
--       end,
--       "Toggle comment",
--     },
--   },

--   v = {
--     ["<C-/>"] = {
--       "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
--       "Toggle comment",
--     },
--   },
-- }

M.tabufline = {
  n = {
    ["<leader>b"] = { "", "buffer" },
    ["<leader>bb"] = { "<cmd> enew <CR>", "New buffer" },
    -- close buffer + hide terminal buffer
    ["<leader>bx"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close current buffer",
    },
    ["<leader>bo"] = {
      function()
        require("nvchad.tabufline").closeOtherBufs()
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
    ["<Space>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<Space>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<Space>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<Space>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<Space>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<Space>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<Space>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
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

M.debug = {
  plugin = true,

  n = {
    ["<leader>dc"] = {
      function()
        if vim.fn.filereadable('.vscode/launch.json') then
          require('dap.ext.vscode').load_launchjs()
        end
        require('dap').continue()
      end,
      "continue"
    },
    ["<F5>"] = {
      function ()
        if vim.fn.filereadable('.vscode/launch.json') then
          require('dap.ext.vscode').load_launchjs()
        end
        require('dap').continue()
      end,
      "continue"
    },
    ["<F10>"] = {
      function ()
        require('dap').step_over()
      end,
      "step over"
    },
    ["<F11>"] = {
      function ()
        require('dap').step_into()
      end,
      "step in"
    },
    ["<leader>do"] = {
      function ()
        require('dap').step_out()
      end,
      "step out"
    },
    ["<F9>"] = {
      function ()
        require('dap').toggle_breakpoint()
      end,
      "toggle_breakpoint"
    },
    ["<leader>dt"] = {
      function ()
        require('dap').terminate()
      end,
      "terminate"
    },
    ["<leader>dh"] = {
      function ()
        require('dap.ui.widgets').hover()
      end,
      "hover"
    },
    ["<leader>dp"] = {
      function ()
        require('dap.ui.widgets').preview()
      end,
      "preview"
    },
    ["<leader>df"] = {
      function ()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
      end,
      "frames"
    },
    ["<leader>ds"] = {
      function ()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
      end,
      "scopes"
    },
  }
}

-- more keybinds!

return M
