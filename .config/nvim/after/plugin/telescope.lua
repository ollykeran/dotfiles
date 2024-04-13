local builtin = require("telescope.builtin")
-- search all files
vim.keymap.set("n", "<leader>sf", builtin.find_files, { })
-- search git files
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
-- grep for things
vim.keymap.set("n", "<leader>gr", function()
        builtin.grep_string({ search = vim.fn.input("grep $> ") });
end)
