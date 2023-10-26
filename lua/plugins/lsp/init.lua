local M = {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig.util")
			local angular_root_dir = util.root_pattern("angular.json", "project.json")

			lspconfig.tsserver.setup({})
			lspconfig.html.setup({})
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			lspconfig.tailwindcss.setup({})
			lspconfig.angularls.setup({
				root_dir = angular_root_dir,
			})
			lspconfig.eslint.setup({})
		end,
	},
}

return M
