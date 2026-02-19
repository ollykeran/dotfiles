local M = {}

M.general = {
  n = {
    ["<leader>q"] = { ":q<CR>", "Quit" },
    ["<leader>w"] = { ":w<CR>", "Save" },
    ["<leader>wq"] = { ":wq<CR>", "Save and quit" },
  },
}

return M
