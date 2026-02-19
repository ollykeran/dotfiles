-- NvChad custom config
local M = {}
M.ui = {}
M.mappings = require "custom.mappings"

M.ui.theme = "nord"
-- Use Martian Mono Nerd Font (install via install-deps.sh)
M.ui.nvdash = {
  load_on_startup = true,
}

M.options = {
  tabstop = 4,
  shiftwidth = 4,
}

return M
