local M = {}

M.get_cwd = function()
	local full_path = vim.api.nvim_buf_get_name(0)
	return full_path:match("(.*[/\\])")
end

M.set_comparison_branch = function(branch)
	_G.comparison_branch = branch
end

M.git_changes = function()
	if _G.comparison_branch then
		require("fzf-lua").git_files({
			cmd = string.format("git diff --name-only %s", _G.comparison_branch),
		})
	else
		print("Set comparison branch with :CBranch <branch_name>")
	end
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

	fb.file_browser(require("telescope.themes").get_dropdown({
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
	}))
end

return M
