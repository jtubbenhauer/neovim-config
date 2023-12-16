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
				ensure_installed = { "vtsls", "angularls", "tailwindcss", "eslint" },
				handlers = {
					lsp.default_setup,

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
					-- 		root_dir = util.root_pattern(".git"),
					-- 	})
					-- end,
					vtsls = function()
						require("lspconfig").vtsls.setup({
							filetypes = {
								"typescript",
								"typescriptreact",
								"typescript.tsx",
								"javascript",
								"javascriptreact",
								"javascript.jsx",
								"html",
								"css",
								"scss",
							},
							root_dir = util.root_pattern(".git"),
						})
					end,

					angularls = function()
						require("lspconfig").angularls.setup({
							filetypes = {
								"typescript",
								"html",
								"css",
								"scss",
							},
							root_dir = util.root_pattern(".git"),
							on_init = function(client)
								client.server_capabilities.renameProvider = false
							end,
						})
					end,

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
