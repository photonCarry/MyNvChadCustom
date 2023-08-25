local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "folke/which-key.nvim",
    keys = { "<leader>", '"', "'", "`", "c", "v", " " },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },
  {
    "NvChad/base46",
    config = function()
      require("base46").toggle_transparency()
    end,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "fatih/vim-go",
    ft = "go",
    -- init = function()
    --   require("core.utils").lazy_load "vim-go"
    -- end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
       require("core.utils").lazy_load "nvim-dap"
       require("core.utils").load_mappings "debug"
    end,
    config = function ()
      local dap = require('dap')
      dap.adapters.go = {
        type = 'executable';
        command = 'node';
        args = {os.getenv('HOME') .. '/vscode-go/dist/debugAdapter.js'};
        --args = {'/home/yy/vscode-go/dist/debugAdapter.js'};
      }
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    init = function()
       require("core.utils").lazy_load "nvim-dap-ui"
    end,
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "simrat39/symbols-outline.nvim", -- 侧边导航
    init = function()
      require("core.utils").lazy_load "symbols-outline.nvim"
      require("core.utils").load_mappings "symbolsoutline"
    end,
    config = function()
      require("symbols-outline").setup()
    end,
  },
  {
    "ggandor/leap.nvim", -- s快速搜索
    init = function()
      require("core.utils").lazy_load "leap.nvim"
    end,
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "gelguy/wilder.nvim", -- 命令行搜索
    dependencies = "romgrk/fzy-lua-native",
    lazy = false,
    config = function(_, opts)
      -- http://neovimcraft.com/plugin/gelguy/wilder.nvim/index.html
      local wilder = require("wilder")
      wilder.setup({modes = {':', '/', '?'}})
      -- Disable Python remote plugin
      wilder.set_option('use_python_remote_plugin', 0)
      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.cmdline_pipeline({
            fuzzy = 1,
            fuzzy_filter = wilder.lua_fzy_filter(),
          }),
          wilder.vim_search_pipeline()
        )
      })
      wilder.set_option('renderer', wilder.renderer_mux({
        [':'] = wilder.popupmenu_renderer({
          highlighter = wilder.lua_fzy_highlighter(),
          left = {
            ' ',
            wilder.popupmenu_devicons()
          },
          right = {
            ' ',
            wilder.popupmenu_scrollbar()
          },
        }),
        ['/'] = wilder.wildmenu_renderer({
          highlighter = wilder.lua_fzy_highlighter(),
        }),
      }))
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- 自动缩进
  {
    "Darazaki/indent-o-matic",
    init = function()
      require("core.utils").lazy_load "indent-o-matic"
    end,
    config = function(_, opts)
      require('indent-o-matic').setup {
        -- The values indicated here are the defaults
    
        -- Number of lines without indentation before giving up (use -1 for infinite)
        max_lines = 2048,
    
        -- Space indentations that should be detected
        standard_widths = { 2, 4, 8 },
    
        -- Skip multi-line comments and strings (more accurate detection but less performant)
        skip_multiline = true,
    }
    end,
  },
  -- 恢复上次编辑位置
  {
    "ethanholz/nvim-lastplace",
    lazy = false,
    init = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
        lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
        lastplace_open_folds = true
      }
    end,
  },
  

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
