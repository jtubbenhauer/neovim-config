local M = {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/nvim-cmp" },
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			local lsp = require("lsp-zero")
			local util = require("lspconfig").util
			lsp.extend_lspconfig()

			lsp.on_attach(function(_, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp.default_keymaps({ buffer = bufnr })
			end)

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "tsserver", "angularls", "tailwindcss", "html" },
				handlers = {
					lsp.default_setup,
					angularls = function()
						require("lspconfig").angularls.setup({
							root_dir = util.root_pattern(".git"),
						})
					end,
				},
			})

			local cmp = require("cmp")
			local luasnip = require("luasnip")
			cmp.setup({
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
	},
}

return M
