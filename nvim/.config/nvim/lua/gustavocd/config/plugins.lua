return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
	{ "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter
	{ "numToStr/Comment.nvim" }, -- Easily comment stuff

	{
		"nvim-tree/nvim-tree.lua",
		requires = "nvim-tree/nvim-web-devicons",
	},
	{ "akinsho/bufferline.nvim" },
	{ "moll/vim-bbye" },
	{ "nvim-lualine/lualine.nvim" },
	{ "lewis6991/impatient.nvim" },
	{ "ahmedkhalf/project.nvim" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "goolord/alpha-nvim" },
	{ "antoinemadec/FixCursorHold.nvim" }, -- This is needed to fix lsp doc highlight
	{ "folke/which-key.nvim" },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	-- cmp plugins
	{ "hrsh7th/nvim-cmp" }, -- The completion plugin
	{ "hrsh7th/cmp-buffer" }, -- buffer completions
	{ "hrsh7th/cmp-path" }, -- path completions
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-cmdline" }, -- cmdline completions
	{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions

	-- snippets
	{ "L3MON4D3/LuaSnip" }, --snippet engine
	{ "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use

	-- LSP
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" }, -- enable LSP
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters

	-- Telescope
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-media-files.nvim" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},
	{ "p00f/nvim-ts-rainbow" },
	-- use "nvim-treesitter/playground"
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	-- Git
	{ "lewis6991/gitsigns.nvim" },
	{ "NvChad/nvim-colorizer.lua" },
	{ "roobert/tailwindcss-colorizer-cmp.nvim" },

	-- copilot
	{
		"zbirenbaum/copilot.lua",
		enabled = true,
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = true,
					keymap = {
						jump_next = "<c-j>",
						jump_prev = "<c-k>",
						accept = "<c-a>",
						refresh = "r",
						open = "<M-CR>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<c-a>",
						accept_word = false,
						accept_line = false,
						next = "<c-j>",
						prev = "<c-k>",
						dismiss = "<C-e>",
					},
				},
			})
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		after = {},
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	{
		"pmizio/typescript-tools.nvim",
		event = { "BufReadPre", "BufNewFile" },
		ft = { "typescript", "typescriptreact" },
		config = function()
			require("gustavocd.typescript-tools")
		end,
	},

	-- Go
	-- use("ray-x/go.nvim")
	-- use("ray-x/guihua.lua")
	{ "fatih/vim-go" },
}
