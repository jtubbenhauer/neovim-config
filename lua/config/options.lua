local o = vim.o
local wo = vim.wo
local g = vim.g

g.mapleader = " "
o.hlsearch = false
wo.number = true
o.mouse = "a"
o.clipboard = "unnamedplus"
o.breakindent = true
o.ignorecase = true
o.smartcase = true
wo.signcolumn = "yes"
o.updatetime = 250
o.timeout = true
o.timeoutlen = 300
o.completeopt = "menuone,noselect"
o.termguicolors = true
o.relativenumber = true
o.scrolloff = 15
o.incsearch = true
o.autoindent = true
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
wo.cursorline = true

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	float = {
		border = "single",
		format = function(diagnostic)
			return string.format(
				"%s (%s) [%s]",
				diagnostic.message,
				diagnostic.source,
				diagnostic.code or diagnostic.user_data.lsp.code
			)
		end,
	},
})
