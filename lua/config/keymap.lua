vim.g.mapleader = " "

-- move lines with selection up and down
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Netrw
vim.keymap.set("n", "<leader>p", ":Ex<CR>")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-h>", "<C-w>h")
-- for some reason C-l is not overridden in Netrw, so here's a little workaround
vim.api.nvim_create_autocmd("filetype", {
	pattern = "netrw",
	desc = "Better mappings for netrw",
	callback = function()
		vim.keymap.set("n", "<C-l>", "<C-w>l", { remap = true, buffer = true })
	end,
})

-- LSP
vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
vim.keymap.set("n", "<leader>l", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Git
vim.keymap.set("n", "<leader>gs", ":G status<CR>")
vim.keymap.set("n", "<leader>gp", ":G push<CR>")
vim.keymap.set("n", "<leader>gc", ":G commit<CR>")
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})

return {}
