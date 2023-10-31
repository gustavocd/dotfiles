local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local keymap2 = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap2("n", "<leader>f", function()
	Telescope = require("telescope.builtin")
	Telescope.find_files(require("telescope.themes").get_dropdown({ previewer = false }))
end, opts)

keymap2("n", "<c-t>", function()
	Telescope = require("telescope.builtin")
	Telescope.live_grep()
end, opts)

keymap2("n", "K", function()
	vim.lsp.buf.hover()
end)

keymap2("n", "gd", function()
	vim.lsp.buf.definition()
end, opts)

keymap2("n", "<C-k>", function()
	vim.lsp.buf.signature_help()
end, opts)

keymap2("n", "<leader>rn", function()
	vim.lsp.buf.rename()
end, opts)

keymap2("n", "gi", function()
	vim.lsp.buf.implementation()
end, opts)

keymap2("n", "gD", function()
	vim.lsp.buf.declaration()
end, opts)

keymap2("n", "gr", function()
	vim.lsp.buf.references()
end, opts)

keymap2("n", "gl", function()
	vim.lsp.diagnostic.open_float()
end, opts)

keymap2("n", "[d", function()
	vim.lsp.diagnostic.goto_prev({ border = "rounded" })
end, opts)

keymap2("n", "]d", function()
	vim.lsp.diagnostic.goto_next({ border = "rounded" })
end, opts)

keymap2("n", "<leader>q", function()
	vim.lsp.diagnostic.set_loclist()
end, opts)
-- Nvimtree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
