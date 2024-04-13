vim.g.mapleader = " "
vim.keymap.set("n", "<leader>f", vim.cmd.RangerCurrentDirectory)
vim.keymap.set("n", "<leader>fe", vim.cmd.RangerCurrentDirectoryNewTab)
-- use Ctrl+S to write
vim.keymap.set("n", "<C-s>", vim.cmd.write)
vim.keymap.set("i", "<C-s>", vim.cmd.write)

-- make Ctrl Z in insert behave like Ctrl U in normal
-- for undoing without leaving insert mode
vim.keymap.set("i", "<C-z>", "<C-o>u", {noremap = true})
-- Ctrl R redo to work in insert mode	
vim.keymap.set("i", "<C-r>", "<C-o>r", {noremap = true})
