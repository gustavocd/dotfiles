local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
	return
end

local lua_ls = require("gustavocd.lsp.settings.lua_ls")
local jsonls = require("gustavocd.lsp.settings.jsonls")
local pyright = require("gustavocd.lsp.settings.pyright")
local gopls = require("gustavocd.lsp.settings.go")

lsp_config.jsonls.setup(jsonls)
lsp_config.pyright.setup(pyright)
lsp_config.gopls.setup(gopls)
lsp_config.tsserver.setup({})
lsp_config.eslint.setup({})
lsp_config.lua_ls.setup(lua_ls)
