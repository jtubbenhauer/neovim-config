local M = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			dim_inactive = {
				enabled = true,
				percentage = 0.05,
			},
			no_italic = true,
		})
		vim.cmd([[colorscheme catppuccin-mocha]])
	end,
}

return M
