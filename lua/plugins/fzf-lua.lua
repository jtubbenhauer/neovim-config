local M = {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			keymap = {
				fzf = {
					["ctrl-d"] = "half-page-down",
					["ctrl-u"] = "half-page-up",
				},
			},
			winopts = {
				fullscreen = true,
				preview = {
					layout = "vertical",
					vertical = "down:40%",
				},
			},
		})
	end,
}

return M
