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
		hints = {
			parameterNames = true,
			functionTypeParameters = true,
			assignVariableTypes = true,
			compositeLiteralFields = true,
			constantValues = true,
		},
		allExperiments = true,
	},
}

return M
