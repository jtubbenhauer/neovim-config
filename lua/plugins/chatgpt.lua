local M = {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		local home = vim.fn.expand("$HOME")

		require("chatgpt").setup({
			api_key_cmd = "cat " .. home .. "/openai.txt",
			openai_params = {
				model = "gpt-4",
			},
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}

return M
