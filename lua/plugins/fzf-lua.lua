local M = {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			winopts = {
				height = 0.9,
				width = 0.9,
				preview = {
					layout = "horizontal",
					horizontal = "right:50%",
				},
			},
		})
	end,
}

return M
