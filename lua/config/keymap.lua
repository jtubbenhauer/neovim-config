local set = vim.keymap.set
local add = require("selfhelp").add

-- Telescope
set("n", "<leader>ff", ":lua require('utils').test_fzf()<cr>")
add({
	mode = "n",
	lhs = "<leader>sf",
	rhs = ":lua require('telescope-pretty-pickers').prettyFilesPicker({ picker = 'find_files' })<cr>",
	desc = "Search files",
	category = "Search",
})
add({
	mode = "n",
	lhs = "<leader>ss",
	-- rhs = ":lua require('telescope-pretty-pickers').prettyGitPicker({ picker = 'git_status' })<cr>",
	rhs = ":Telescope git_status<cr>",
	desc = "Search git status",
	category = "Search",
})
add({
	mode = "n",
	lhs = "<leader>sc",
	rhs = ":lua require('utils').telescope_git_changes()<cr>",
	desc = "Search git changes",
	category = "Search",
})
add({
	mode = "n",
	lhs = "<leader>qf",
	rhs = ":lua require('telescope.builtin').quickfix()<cr>",
	desc = "Search quickfix",
	category = "Search",
})
add({
	mode = "n",
	lhs = "<leader>sg",
	rhs = ":lua require('telescope-pretty-pickers').prettyGrepPicker({ picker = 'live_grep' })<cr>",
	desc = "Search live grep",
	category = "Search",
})
add({
	mode = "n",
	lhs = "<leader>sh",
	rhs = ":lua require('telescope-pretty-pickers').prettyGrepPicker({ picker = 'live_grep', { vimgrep_arguments = {'--hidden'} } })<cr>",
	desc = "Search live grep (hidden)",
	category = "Search",
})
add({
	mode = "n",
	lhs = "<leader>so",
	rhs = ":lua require('telescope-pretty-pickers').prettyFilesPicker({ picker = 'oldfiles' })<cr>",
	desc = "Search recent files",
	category = "Search",
})
add({ mode = "n", lhs = "<leader>sa", rhs = ":Telescope resume<cr>", desc = "Resume last search", category = "Search" })
add({
	mode = "n",
	lhs = "<leader>sd",
	rhs = ":lua require('utils').oil_to_path()<cr>",
	desc = "Search directory",
	category = "Search",
})
add({
	mode = "n",
	lhs = "<leader>si",
	rhs = ":lua require('utils').grep_directory()<cr>",
	desc = "Grep in directory",
	category = "Search",
})

add({
	mode = "n",
	lhs = "<leader>qq",
	rhs = ":SelfHelp<cr>",
	desc = "Show help",
	category = "General",
})

-- File browser
add({
	mode = "n",
	lhs = "<leader>er",
	rhs = ":Oil .<cr>",
	desc = "Open file browser in root directory",
	category = "File Browser",
})
add({
	mode = "n",
	lhs = "<leader>ed",
	rhs = ":Oil<cr>",
	desc = "Open file browser in current directory",
	category = "File Browser",
})

-- LSP
set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
set("n", "gn", ":lua vim.diagnostic.goto_next()<CR>")
set("n", "gp", ":lua vim.diagnostic.goto_prev()<CR>")
set("n", "ge", ":lua vim.diagnostic.open_float()<CR>")
set("n", "gd", ":Telescope lsp_definitions<CR>")
set("n", "gr", ":Telescope lsp_references<CR>")
set("n", "gh", ":lua vim.lsp.buf.hover()<CR>")

-- General
set("n", "<C-s>", "<cmd>w<cr>")
set({ "i", "v" }, "<C-s>", "<Esc><cmd>w<cr>")
set("n", "<leader>vs", "<cmd>vs<CR><cmd>wincmd l<CR>")
set("n", "<leader>ct", "<cmd>tabclose<CR>")
set("n", "<leader>cb", "<cmd>q<cr>")
add({ mode = "n", lhs = "<leader>ms", rhs = ":Messages messages<cr>", desc = "Show messages", category = "General" })
set("n", "<C-e>", "2<C-e>")
set("n", "<C-y>", "2<C-y>")
set({ "n", "i", "v" }, "<C-h>", ":vertical resize -5<CR>")
set({ "n", "i", "v" }, "<C-l>", ":vertical resize +5<CR>")
-- set({ "n", "i", "v" }, "<C-j>", ":resize -5<CR>")
-- set({ "n", "i", "v" }, "<C-k>", ":resize +5<CR>")
add({ mode = "n", lhs = "<leader>ci", rhs = ":Inspect<CR>", desc = "Inspect character", category = "General" })
add({ mode = "n", lhs = "<leader>sv", rhs = ":SSave default<CR>", desc = "Save session", category = "Session" })
add({ mode = "n", lhs = "<leader>sl", rhs = ":SLoad default<CR>", desc = "Load session", category = "Session" })

-- Diffview
add({
	mode = "n",
	lhs = "<leader>ds",
	rhs = ":lua require('utils').toggle_diffview_status()<CR>",
	desc = "Toggle diffview status",
	category = "Diffview",
})
add({
	mode = "n",
	lhs = "<leader>db",
	rhs = ":lua require('utils').toggle_diffview_branch()<CR>",
	desc = "Toggle diffview branch",
	category = "Diffview",
})
add({
	mode = "n",
	lhs = "<leader>dh",
	rhs = ":DiffviewFileHistory %<CR>",
	desc = "Diffview file history",
	category = "Diffview",
})

-- ChatGPT
set("n", "<leader>ch", "<cmd>ChatGPT<cr>")
set("n", "<leader>che", "<cmd>ChatGPTEditWithInstructions<cr>")

-- Aerial
add({ mode = "n", lhs = "<leader>ae", rhs = ":AerialToggle<cr>", desc = "Toggle Aerial", category = "Aerial" })

-- Spectre
add({
	mode = "n",
	lhs = "<leader>sr",
	rhs = ":lua require('spectre').toggle()<cr>",
	desc = "Search and replace",
	category = "Spectre",
})

-- Git
add({
	mode = "n",
	lhs = "<leader>gsb",
	rhs = ':lua require("utils").change_git_signs_base()<cr>',
	desc = "Change git signs base branch",
	category = "Git",
})
add({
	mode = "n",
	lhs = "<leader>gs",
	rhs = ":vertical G<cr>",
	desc = "Git status",
	category = "Git",
})

-- Oil
add({
	mode = "n",
	lhs = "<leader>dc",
	rhs = ":lua require('utils').get_trimmed_cwd()<cr>",
	desc = "Print current oil directory",
	category = "Oil",
})
