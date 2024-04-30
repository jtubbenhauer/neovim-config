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
			{ "mfussenegger/nvim-dap" },
			{ "jay-babu/mason-nvim-dap.nvim" },
			{ "rcarriga/nvim-dap-ui" },
		},
		config = function()
			vim.g.lsp_zero_extend_lspconfig = 0
			local lsp = require("lsp-zero")
			lsp.extend_lspconfig()
			local util = require("lspconfig").util
			lsp.on_attach(function(_, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
			end)

			require("mason").setup()
			require("mason-nvim-dap").setup()
			require("mason-lspconfig").setup({
				handlers = {
					lsp.default_setup,

					angularls = function()
						require("lspconfig").angularls.setup({
							root_dir = util.root_pattern("angular.json", "project.json", ".git"),
							on_init = function(client)
								client.server_capabilities.renameProvider = false
							end,
						})
					end,

					vtsls = function()
						require("lspconfig").vtsls.setup({
							capabilities = capabilities,
						})
					end,

					-- tsserver = function()
					-- 	require("lspconfig").tsserver.setup({
					-- 		filetypes = {
					-- 			"typescript",
					-- 			"typescriptreact",
					-- 			"typescript.tsx",
					-- 			"javascript",
					-- 			"javascriptreact",
					-- 			"javascript.jsx",
					-- 			"html",
					-- 			"css",
					-- 			"scss",
					-- 		},
					-- 	})
					-- end,

					lua_ls = function()
						require("lspconfig").lua_ls.setup({
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" },
									},
								},
							},
						})
					end,
				},
			})

			local cmp = require("cmp")
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-a>"] = cmp.mapping.complete(),
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
