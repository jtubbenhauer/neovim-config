local set = vim.keymap.set

-- Telescope
set("n", "<leader>sf", ":lua require('telescope-pretty-pickers').prettyFilesPicker({ picker = 'find_files' })<cr>")
set("n", "<leader>ss", ":Telescope git_status<cr>")
set("n", "<leader>sc", ":lua require('utils').telescope_git_changes()<cr>")
set("n", "<leader>sg", ":lua require('telescope-pretty-pickers').prettyGrepPicker({ picker = 'live_grep' })<cr>")
set("n", "<leader>so", ":lua require('telescope-pretty-pickers').prettyFilesPicker({ picker = 'oldfiles' })<cr>")
set("n", "<leader>sr", ":Telescope resume<cr>")
set("n", "<leader>sd", ":lua require('utils').oil_to_path()<cr>")
set("n", "<leader>si", ":lua require('utils').grep_directory()<cr>")
-- si to search in directory

-- File browser
set("n", "<leader>ef", ":Oil . <cr>")
set("n", "<leader>ed", ":Oil <cr>")

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
set("n", "<leader>ye", ":let @* = execute('messages')<cr>")
set("n", "<leader>ms", ":Messages messages<cr>")
set("n", "<C-e>", "2<C-e>")
set("n", "<C-y>", "2<C-y>")
set({ "n", "i", "v" }, "<C-h>", ":vertical resize -5<CR>")
set({ "n", "i", "v" }, "<C-l>", ":vertical resize +5<CR>")
-- set({ "n", "i", "v" }, "<C-j>", ":resize -5<CR>")
-- set({ "n", "i", "v" }, "<C-k>", ":resize +5<CR>")
set("n", "<leader>ci", ":Inspect<CR>")
set("n", "<leader>sv", ":SSave default<CR>")
set("n", "<leader>sl", ":SLoad default<CR>")

-- Diffview
set("n", "<leader>ds", ":lua require('utils').toggle_diffview_status()<CR>")
set("n", "<leader>db", ":lua require('utils').toggle_diffview_branch()<CR>")
set("n", "<leader>dh", ":DiffviewFileHistory %<CR>")

-- Lazygit
set("n", "<leader>gg", "<cmd>LazyGit<cr>")

-- ChatGPT
set("n", "<leader>ch", "<cmd>ChatGPT<cr>")
set("n", "<leader>che", "<cmd>ChatGPTEditWithInstructions<cr>")

-- Aerial
set("n", "<leader>ae", ":AerialToggle<cr>")
