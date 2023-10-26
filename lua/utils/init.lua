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
			cmd = string.format("git diff --name-only %s | sed -e 's|^(.*/)*(.*/[^/]*)$|\2|'", _G.comparison_branch),
		})
	else
		print("Set comparison branch with :CBranch <branch_name>")
	end
end

M.shorten_path = function(path)
	return path:match(".*/(.*/[^/]+)$") or path
end

return M
