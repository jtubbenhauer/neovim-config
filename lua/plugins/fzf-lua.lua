local M = {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			files = {
				fzf_opts = {
					["--keep-right"] = "",
				},
			},
		})
	end,
}

return M
