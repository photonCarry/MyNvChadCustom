---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- toggle
  },
}

M.nvimtree = {
  n = {
    -- toggle
    ["<F1>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.vista = {
  plugin = true,

  n = {
    -- toggle
    ["<F2>"] = { "<cmd> Vista!! <CR>", "Toggle vista" },
  },
}

-- more keybinds!

return M
