---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'tokyonight',
  statusline = {
    separator_style = "round",
  },
  nvdash = {
    load_on_startup = true,
  }
}
M.plugins = 'custom.plugins'
return M
