local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = true,
	sources = {
		formatting.stylua,
		formatting.gofmt,
		formatting.goimports,
		diagnostics.golangci_lint,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.prettier.with({
			only_local = "node_modules/.bin",
			condition = function(utils)
				return utils.has_file({
					".prettierrc.js",
					".prettierrc.json",
					".prettierrc",
					".prettierrc.yml",
					".prettierrc.yaml",
					"package.json",
				})
			end,
		}),
		diagnostics.eslint.with({
			only_local = "node_modules/.bin",
			condition = function(utils)
				return utils.root_has_file({
					".eslintrc.js",
					".eslintrc.json",
					".eslintrc",
					".eslintrc.yml",
					".eslintrc.yaml",
					"package.json",
				})
			end,
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
