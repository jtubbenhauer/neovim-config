local M = {
	"maxmx03/dracula.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		local dracula = require("dracula")
		dracula.setup({
			colors = {
				fg = "#e6e6e6",
			},
			overrides = function(colors)
				return {
					DiffAdd = { bg = "#314436", fg = colors.fg },
				}
			end,
		})
		vim.cmd("colorscheme dracula")
	end,
}

return M
