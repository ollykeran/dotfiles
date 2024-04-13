require("kerano")
vim.wo.relativenumber = true
vim.wo.number = true	

---
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4


vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true } )

-- :Wq == :wq because I cant type
vim.cmd([[cnoreabbrev Wq wq]])

--- use ranger instead of netrw is open a dir
vim.g.NERDTreeHijackNetrw = 0 -- add this line if you use NERDTree
vim.g.ranger_replace_netrw = 1 -- open ranger when vim opens a directory
vim.g.ranger_command_override = 'ranger --cmd "set show_hidden=true"'
