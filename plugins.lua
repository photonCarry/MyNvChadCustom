local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

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
    init = function()
      require("core.utils").lazy_load "vim-go"
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
