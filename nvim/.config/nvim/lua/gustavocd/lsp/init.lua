local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
	return
end

mason.setup({
	ui = {
		border = GcdVim.ui.float.border,
	},
})

mason_lsp.setup({
	-- A list of servers to automatically install if they're not already installed
	ensure_installed = {
		"bashls",
		"cssls",
		"eslint",
		"graphql",
		"html",
		"jsonls",
		"lua_ls",
		"prismals",
		"tailwindcss",
		"gopls",
	},
	-- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
	-- This setting has no relation with the `ensure_installed` setting.
	-- Can either be:
	--   - false: Servers are not automatically installed.
	--   - true: All servers set up via lspconfig are automatically installed.
	--   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
	--       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
	automatic_installation = true,
})

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		silent = true,
		border = GcdVim.ui.float.border,
	}),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = GcdVim.ui.float.border }),
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ virtual_text = GcdVim.lsp.virtual_text }
	),
}

local function on_attach(_, _)
	-- set up buffer keymaps, etc.
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

lspconfig.gopls.setup({
	capabilities = capabilities,
	handlers = handlers,
	on_attach = on_attach,
	settings = require("gustavocd.lsp.servers.gopls").settings,
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	handlers = handlers,
	on_attach = on_attach,
	settings = require("gustavocd.lsp.servers.lua_ls").settings,
})

for _, server in ipairs({ "bashls", "emmet_ls", "graphql", "html", "prismals" }) do
	lspconfig[server].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		handlers = handlers,
	})
end

require("gustavocd.lsp.null_ls")
