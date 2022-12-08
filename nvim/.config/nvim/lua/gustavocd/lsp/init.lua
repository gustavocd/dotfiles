local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

local mason = require("mason")
local lspZero = require("lsp-zero")

lspZero.preset("recommended")
lspZero.setup()

mason.setup()

require "gustavocd.lsp.handlers".setup()
require "gustavocd.lsp.null-ls"
