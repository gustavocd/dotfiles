local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

colorizer.setup({
	filetypes = {
		"css",
		"javascript",
		"jsx",
		"tsx",
		"scss",
		"svelte",
		html = { mode = "foreground" },
	},
	user_default_options = {
		rgb_fn = true,
		hsl_fn = true,
		css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
		names = true,
	},
})
