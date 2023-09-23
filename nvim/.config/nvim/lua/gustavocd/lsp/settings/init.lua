local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
	return
end

local jsonls = require("gustavocd.lsp.settings.jsonls")
local pyright = require("gustavocd.lsp.settings.pyright")

lsp_config.jsonls.setup(jsonls)
lsp_config.pyright.setup(pyright)
