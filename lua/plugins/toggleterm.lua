local M = {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				close_on_exit = true,
				shade_terminals = false,
				direction = "horizontal",
			})
		end,
	},
}

return M
