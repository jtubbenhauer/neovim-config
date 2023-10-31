local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		dependencies = {
			--
		},
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
			}),
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
			}),
			confirmation = {
				completeopt = "menu,menuone,noinsert",
			},
		})
	end,
}

return M
