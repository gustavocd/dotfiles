local M = {}

M.settings = {
	gopls = {
		analyses = {
			unusedparams = true,
		},
		staticcheck = true,
		gofumpt = true,
		completeUnimported = true,
		usePlaceholders = true,
	},
}

return M

