local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

local mason = require("mason")
local lsp_zero = require("lsp-zero")

mason.setup()
lsp_zero.preset("recommended")
lsp_zero.setup()

require("gustavocd.lsp.settings")
require("gustavocd.lsp.handlers").setup()
require("gustavocd.lsp.null-ls")
