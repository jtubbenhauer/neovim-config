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
			local git_root_dir = util.root_pattern(".git")

			lspconfig.tsserver.setup({
				root_dir = git_root_dir,
			})
			lspconfig.html.setup({
				root_dir = git_root_dir,
			})
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
