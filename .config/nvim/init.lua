require("kerano")

-- vim opts 
vim.api.nvim_set_option("clipboard","unnamed")
-- fat block in insert mode
vim.opt.guicursor = ""
vim.opt.clipboard = "unnamed"
-- line nums
vim.wo.relativenumber = true
vim.wo.number = true	

--- indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
-- Shift tab behaves like it should 
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true } )

-- undo opts
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search 
vim.opt.hlsearch = false 
vim.opt.incsearch = true

-- colours
vim.opt.termguicolors = true

-- scroll
vim.opt.scrolloff = 10 
vim.opt.signcolumn = "yes"

-- update fast 
vim.opt.updatetime = 50 

-- :Wq == :wq because I cant type
vim.cmd([[cnoreabbrev Wq wq]])

--- use ranger instead of netrw is open a dir
vim.g.NERDTreeHijackNetrw = 0 
vim.g.ranger_replace_netrw = 1 
vim.g.ranger_command_override = 'ranger --cmd "set show_hidden=true"'

-- inconsistent airline config
vim.g.airline_extensions_tabline_enabled = 1
vim.g.airline_statusline_ontop = 1
vim.g.airline_powerline_fonts = 1
