local M = {
	"zbirenbaum/copilot.lua",
	config = function()
		require("copilot").setup({
			suggestion = {
				auto_trigger = false,
				keymap = {
					accept = "<Tab>",
				},
			},
		})
	end,
}

return {}
