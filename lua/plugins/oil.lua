local M = {
	dir = "~/dev/nvim-plugins/oil.nvim",
	-- "stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			lsp_rename_autosave = true,
			view_options = {
				show_hidden = true,
			},
		})
	end,
}

return M
