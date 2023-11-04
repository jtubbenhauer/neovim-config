local FixDraculaColors = function()
	local diff_add_bg = "#314436"
	local diff_delete_bg = "#553030"
	local diff_change_bg = "#47424A"
	vim.api.nvim_set_hl(0, "DiffAdd", { bg = diff_add_bg })
	vim.api.nvim_set_hl(0, "DiffDelete", { bg = diff_delete_bg })
	vim.api.nvim_set_hl(0, "DiffChange", { bg = diff_change_bg })
end

local M = {
	"Mofiqul/dracula.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		local dracula = require("dracula")
		dracula.setup({
			colors = {
				fg = "#dcdcdc",
			},
		})

		vim.cmd([[colorscheme dracula]])

		FixDraculaColors()
	end,
}

return M
