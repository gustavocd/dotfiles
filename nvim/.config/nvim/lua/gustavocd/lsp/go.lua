local go_lsp_status_ok, go_lsp = pcall(require, "go")
if not go_lsp_status_ok then
	return
end

go_lsp.setup()
