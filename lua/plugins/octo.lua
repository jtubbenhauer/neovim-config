local M = {
	"pwntester/octo.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("octo").setup({
			picker = "fzf-lua",
			suppress_missing_scope = {
				projects_v2 = true,
			},
		})
	end,
}

return M
