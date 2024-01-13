return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local wk = require("which-key")
		wk.register({
			["<leader>a"] = "Add to Harpoon List",
			["<leader>p"] = "Open File Explorer",
			["<leader>r"] = "Rename Symbol",
			["<leader>l"] = "Format Code",
			["<leader>f"] = { name = "+telescope", f = "Find Files", g = "Live Grep", b = "Buffers", h = "Help Tags" },
			["<leader>h"] = {
				name = "+gitsigns",
				r = "Reset Hunk",
				R = "Reset Buffer",
				p = "Preview Hunk",
				b = "Blame Line",
				d = "Diff this",
			},
			["<leader>g"] = {
				name = "+git",
				b = "List Branches",
				c = "Commit",
				p = "Push",
				s = "Status",
			},
		})
	end,
}
