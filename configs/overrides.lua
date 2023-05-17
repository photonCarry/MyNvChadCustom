local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "go",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  update_focused_file = {
    enable = false,
  },
  remove_keymaps = true,

  on_attach = function (bufnr)
    local api = require('nvim-tree.api')
  
    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
  
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', 'p', api.node.open.preview, opts('Open Preview'))
    vim.keymap.set('n', '<C-r>', api.tree.reload, opts('Refresh'))
    vim.keymap.set('n', 'yn', api.fs.copy.filename, opts('Copy Name'))
    vim.keymap.set('n', 'yp', api.fs.copy.relative_path, opts('Copy Relative Path'))
    vim.keymap.set('n', 'yy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
    vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
    vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
    vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
    vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
    vim.keymap.set('n', 'R', api.tree.collapse_all, opts('Collapse'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  end
}

M.telescope = {
  mappings = {
    i = {
      ["<C-c>"] = require("telescope.actions").close,
      -- <C-n>/<Down>	Next item
      -- <C-p>/<Up>
      -- <C-u>	Scroll up in preview window
      -- <C-d>	Scroll down in preview window
      -- <C-/>	Show mappings for picker actions (insert mode)
      -- ?	Show mappings for picker actions (normal mode)
    },
  },
}

return M
