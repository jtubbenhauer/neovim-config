local FixDraculaColors = function()
	local diff_add_bg = "#314436"
	local diff_delete_bg = "#553030"
	local diff_change_bg = "#2C3942"
	vim.api.nvim_set_hl(0, "DiffAdd", { bg = diff_add_bg })
	vim.api.nvim_set_hl(0, "DiffDelete", { bg = diff_delete_bg })
	vim.api.nvim_set_hl(0, "DiffChange", { bg = diff_change_bg })
	vim.api.nvim_set_hl(0, "DiffText", { bg = diff_add_bg })
end

local M = {
	"Mofiqul/dracula.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		local dracula = require("dracula")
		dracula.setup({
			colors = {
				fg = "#dcdcdc",
				comment = "#7b88b3",
			},
			overrides = function(colors)
				return {
					GitSignsCurrentLineBlame = { link = "Comment" },
					["@lsp.type.property"] = {},
					["@lsp.type.variable"] = { fg = colors.fg },
					["@lsp.type.parameter"] = { fg = colors.fg },
					["@lsp.type.typeParameter.typescript"] = { fg = colors.purple },
					["@lsp.type.class"] = { fg = colors.cyan },
					["@lsp.type.type"] = {},
					["@type"] = { fg = colors.cyan },
					["@boolean"] = { fg = colors.pink },
					["@property"] = { fg = colors.orange },
					["@parameter"] = { fg = colors.orange },
					-- ["@lsp.typemod.variable.readonly.typescript"] = { fg = colors.purple },
					["@lsp.typemod.variable.local.typescript"] = { fg = colors.fg },
					["@type.builtin"] = { fg = colors.pink },
					["@constructor"] = { fg = colors.pink },
					["@variable.builtin"] = { fg = colors.pink },
					["@variable"] = { fg = colors.green },
					["@attribute"] = { fg = colors.green },
					["@operator"] = { fg = colors.fg },
					["@keyword.function"] = { fg = colors.pink },
					["@text.html"] = { fg = colors.fg },
				}
			end,
		})

		vim.cmd([[colorscheme dracula]])

		FixDraculaColors()
	end,
}

return {}
