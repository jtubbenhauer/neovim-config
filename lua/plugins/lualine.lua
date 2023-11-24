local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true,
			},
			winbar = {
				lualine_c = { { "filename", path = 1 } },
				lualine_z = { "tabs" },
			},
			inactive_winbar = {
				lualine_c = { { "filename", path = 1 } },
			},
			sections = {
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
			},
		})
	end,
}

return M
