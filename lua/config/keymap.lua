local set = vim.keymap.set

vim.cmd("command! -nargs=1 CBranch lua require('utils').set_comparison_branch(<f-args>)")
set("n", "<leader>sc", ":lua require('utils').git_changes()<CR>")

-- FzfLua
set("n", "<leader>sf", ":FzfLua files<CR>")
set("n", "<leader>sg", ":FzfLua live_grep_native<CR>")
set("n", "<leader>sr", ":FzfLua oldfiles<CR>")
set("n", "<leader>ss", ":FzfLua git_status<CR>")
set("n", "<leader>sd", ":lua require('fzf-lua').files({ cwd = require('utils').get_cwd() })<CR>")

-- Noetree
set("n", "<leader>ef", ":Neotree position=float<cr>")
set("n", "<leader>ed", ":Neotree position=float reveal=true<cr>")

-- LSP
set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
set("n", "gn", ":lua vim.diagnostic.goto_next()<CR>")
set("n", "gp", ":lua vim.diagnostic.goto_prev()<CR>")
set("n", "ge", ":lua vim.diagnostic.open_float()<CR>")
set("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
set("n", "gr", ":lua vim.lsp.buf.references()<CR>")
set("n", "gh", ":lua vim.lsp.buf.hover()<CR>")

-- General
set("n", "<C-s>", "<cmd>w<cr>")
set({ "i", "v" }, "<C-s>", "<Esc><cmd>w<cr>")
