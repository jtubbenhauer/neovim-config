local M = {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			files = {
				fzf_opts = {
					["--keep-right"] = true,
				},
				-- fzf_opts = {
				-- 	["--delimiter"] = "/",
				-- 	["--with-nth"] = "-1,1..-2",
				-- },
				-- file_icons = false,
			},
			git = {
				files = {
					fzf_opts = {
						["--keep-right"] = true,
					},
				},
				status = {
					fzf_opts = {
						["--keep-right"] = true,
					},
				},
			},
			keymap = {
				fzf = {
					["ctrl-d"] = "half-page-down",
					["ctrl-u"] = "half-page-up",
				},
			},
			winopts = {
				fullscreen = true,
				preview = {
					layout = "horizontal",
					horizontal = "right:50%",
				},
			},
		})
	end,
}

return M
