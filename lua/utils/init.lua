local M = {}

M.get_cwd = function()
	local full_path = vim.api.nvim_buf_get_name(0)
	return full_path:match("(.*[/\\])")
end

M.shorten_path = function(path)
	return path:match(".*/(.*/[^/]+)$") or path
end

M.toggle_diffview_status = function()
	local lib = require("diffview.lib")
	local view = lib.get_current_view()

	if view then
		vim.cmd.DiffviewClose()
	else
		vim.cmd("DiffviewOpen")
	end
end

M.toggle_diffview_branch = function()
	local lib = require("diffview.lib")
	local view = lib.get_current_view()

	if view then
		vim.cmd.DiffviewClose()
	else
		require("telescope.builtin").git_branches(require("telescope.themes").get_dropdown({
			previewer = false,
			attach_mappings = function(_, map)
				map("i", "<CR>", function(prompt_bufnr)
					local selection = require("telescope.actions.state").get_selected_entry()
					require("telescope.actions").close(prompt_bufnr)
					vim.cmd("DiffviewOpen " .. selection.value)
				end)
				return true
			end,
		}))
	end
end

M.oil_to_path = function()
	local fb = require("telescope").extensions.file_browser

	fb.file_browser({
		files = false,
		previewer = false,
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local selection = require("telescope.actions.state").get_selected_entry()
				require("telescope.actions").close(prompt_bufnr)
				vim.cmd("Oil " .. selection.value)
			end)
			return true
		end,
	})
end

M.telescope_git_changes = function()
	require("telescope.builtin").git_branches(require("telescope.themes").get_dropdown({
		previewer = false,
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local selection = require("telescope.actions.state").get_selected_entry()
				require("telescope.actions").close(prompt_bufnr)
				local easypick = require("easypick")
				easypick.setup({
					pickers = {
						{
							name = "changed_files",
							command = "git diff --name-only $(git merge-base HEAD " .. selection.value .. " )",
							previewer = easypick.previewers.branch_diff({ base_branch = selection.value }),
							-- previewer = easypick.previewer.branch_diff({ base_branch = selection.value }),
						},
					},
				})
				vim.cmd("Easypick changed_files")
			end)
			return true
		end,
	}))
end

M.grep_directory = function()
	local oil = require("oil")
	local dir = oil.get_current_dir()

	if dir == nil then
		return
	end

	require("telescope-pretty-pickers").prettyGrepPicker({
		picker = "live_grep",
		options = {
			search_dirs = { dir },
		},
	})
end

M.change_git_signs_base = function()
	require("telescope.builtin").git_branches(require("telescope.themes").get_dropdown({
		previewer = false,
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local selection = require("telescope.actions.state").get_selected_entry()
				require("telescope.actions").close(prompt_bufnr)
				require("gitsigns").change_base(selection.value)
			end)
			return true
		end,
	}))
end

M.test_fzf = function()
	require("fzf-lua").files({
		fn_transform = function(entry)
			print(require("fzf-lua").make_entry.file(entry))
			return entry
		end,
	})
end

M.toggleterm_cwd = function()
	local cwd = M.get_cwd()
	vim.cmd('TermExec cmd="source ~/.zshrc && source ~/.nvm/nvm.sh && nvm use 18" direction=tab dir=' .. cwd)
end

return M
