local M = {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							-- height = 0.9,
							-- width = 0.9,
						},
					},
					sorting_strategy = "ascending",
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
						},
					},
					path_display = "tail",
				},
				pickers = {
					oldfiles = {
						cwd_only = true,
					},
					current_buffer_tags = { fname_width = 100 },
					jumplist = { fname_width = 100 },
					loclist = { fname_width = 100 },
					lsp_definitions = { fname_width = 100 },
					lsp_document_symbols = { fname_width = 100 },
					lsp_dynamic_workspace_symbols = { fname_width = 100 },
					lsp_implementations = { fname_width = 100 },
					lsp_incoming_calls = { fname_width = 100 },
					lsp_outgoing_calls = { fname_width = 100 },
					lsp_references = { fname_width = 100 },
					lsp_type_definitions = { fname_width = 100 },
					lsp_workspace_symbols = { fname_width = 100 },
					quickfix = { fname_width = 100 },
					tags = { fname_width = 100 },
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					file_browser = {
						hijack_netrw = true,
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")
		end,
	},
}

return M
