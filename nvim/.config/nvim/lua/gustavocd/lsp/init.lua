local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require "gustavocd.lsp.lsp-installer"
require "gustavocd.lsp.handlers".setup()
require "gustavocd.lsp.null-ls"

