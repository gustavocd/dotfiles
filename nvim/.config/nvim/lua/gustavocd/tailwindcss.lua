local status_ok, tailwindcss = pcall(require, "tailwindcss-colorizer-cmp")
if not status_ok then
  return
end

tailwindcss.setup({
  color_square_width = 2,
})
