local M = {
	dir = "~/dev/nvim-plugins/dracula.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local dracula = require("dracula")
		dracula.setup({
			colors = {
				fg = "#dcdcdc",
				comment = "#7b88b3",
			},
		})

		vim.cmd([[colorscheme dracula]])
	end,
}

return {}
