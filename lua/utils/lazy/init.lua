---@class lazyvim.util.lsp
local M = {}

---@alias lsp.Client.filter {id?: number, bufnr?: number, name?: string, method?: string, filter?:fun(client: lsp.Client):boolean}

local function can_merge(v)
	return type(v) == "table" and (vim.tbl_isempty(v) or not M.is_list(v))
end

-- Fast implementation to check if a table is a list
---@param t table
function M.is_list(t)
	local i = 0
	---@diagnostic disable-next-line: no-unknown
	for _ in pairs(t) do
		i = i + 1
		if t[i] == nil then
			return false
		end
	end
	return true
end

--- Merges the values similar to vim.tbl_deep_extend with the **force** behavior,
--- but the values can be any type, in which case they override the values on the left.
--- Values will me merged in-place in the first left-most table. If you want the result to be in
--- a new table, then simply pass an empty table as the first argument `vim.merge({}, ...)`
--- Supports clearing values by setting a key to `vim.NIL`
---@generic T
---@param ... T
---@return T
function M.merge(...)
	local ret = select(1, ...)
	if ret == vim.NIL then
		ret = nil
	end
	for i = 2, select("#", ...) do
		local value = select(i, ...)
		if can_merge(ret) and can_merge(value) then
			for k, v in pairs(value) do
				ret[k] = M.merge(ret[k], v)
			end
		elseif value == vim.NIL then
			ret = nil
		elseif value ~= nil then
			ret = value
		end
	end
	return ret
end

---@param opts? lsp.Client.filter
function M.get_clients(opts)
	local ret = {} ---@type lsp.Client[]
	if vim.lsp.get_clients then
		ret = vim.lsp.get_clients(opts)
	else
		---@diagnostic disable-next-line: deprecated
		ret = vim.lsp.get_active_clients(opts)
		if opts and opts.method then
			---@param client lsp.Client
			ret = vim.tbl_filter(function(client)
				return client.supports_method(opts.method, { bufnr = opts.bufnr })
			end, ret)
		end
	end
	return opts and opts.filter and vim.tbl_filter(opts.filter, ret) or ret
end

---@param on_attach fun(client, buffer)
function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf ---@type number
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end

---@param from string
---@param to string
function M.on_rename(from, to)
	local clients = M.get_clients()
	for _, client in ipairs(clients) do
		if client.supports_method("workspace/willRenameFiles") then
			---@diagnostic disable-next-line: invisible
			local resp = client.request_sync("workspace/willRenameFiles", {
				files = {
					{
						oldUri = vim.uri_from_fname(from),
						newUri = vim.uri_from_fname(to),
					},
				},
			}, 1000, 0)
			if resp and resp.result ~= nil then
				vim.lsp.util.apply_workspace_edit(resp.result, client.offset_encoding)
			end
		end
	end
end

function M.get_config(server)
	local configs = require("lspconfig.configs")
	return rawget(configs, server)
end

function M.formatter(opts)
	opts = opts or {}
	local filter = opts.filter or {}
	filter = type(filter) == "string" and { name = filter } or filter
	local ret = {
		name = "LSP",
		primary = true,
		priority = 1,
		format = function(buf)
			M.format(M.merge(filter, { bufnr = buf }))
		end,
		sources = function(buf)
			local clients = M.get_clients(M.merge(filter, { bufnr = buf }))
			---@param client lsp.Client
			local ret = vim.tbl_filter(function(client)
				return client.supports_method("textDocument/formatting")
					or client.supports_method("textDocument/rangeFormatting")
			end, clients)
			---@param client lsp.Client
			return vim.tbl_map(function(client)
				return client.name
			end, ret)
		end,
	}
	return M.merge(ret, opts)
end

---@alias lsp.Client.format {timeout_ms?: number, format_options?: table} | lsp.Client.filter

---@param opts? lsp.Client.format
function M.format(opts)
	opts = vim.tbl_deep_extend("force", {}, opts or {}, require("lazyvim.util").opts("nvim-lspconfig").format or {})
	local ok, conform = pcall(require, "conform")
	-- use conform for formatting with LSP when available,
	-- since it has better format diffing
	if ok then
		opts.formatters = {}
		opts.lsp_fallback = true
		conform.format(opts)
	else
		vim.lsp.buf.format(opts)
	end
end

return M
