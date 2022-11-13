local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Treesitter, Better syntax highlighting.
	-- https://github.com/nvim-treesitter/nvim-treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "8ec59aee8097c64fcf27d1dbd77ea181c50846c5",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- Treesitter Rainbow, Making pair brackets same color.
	-- https://github.com/p00f/nvim-ts-rainbow
	use({ "p00f/nvim-ts-rainbow", commit = "fad8badcd9baa4deb2cf2a5376ab412a1ba41797" })

	-- Start screen
	-- use({ "glepnir/dashboard-nvim", commit = "1aab263f4773106abecae06e684f762d20ef587e" })

	-- LSP
	use({ "williamboman/mason.nvim", commit ="d85d71e910d1b2c539d17ae0d47dad48f8f3c8a7" })
	use({ "williamboman/mason-lspconfig.nvim", commit="a910b4d50f7a32d2f9057d636418a16843094b7c" })
	use({ "neovim/nvim-lspconfig", tag="v0.1.3"})
	use({ "jose-elias-alvarez/null-ls.nvim", commit="07d4ed4c6b561914aafd787453a685598bec510f" })
	--use { "RRethy/vim-illuminate", commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3" }

	-- completions
	use({ "hrsh7th/nvim-cmp", tag = "v0.0.1" })
	use({ "hrsh7th/cmp-buffer", commit="3022dbc9166796b644a841a02de8dd1cc1d311fa" })
	use({ "hrsh7th/cmp-nvim-lsp", commit="78924d1d677b29b3d1fe429864185341724ee5a2" })
	use({ "hrsh7th/cmp-path", commit="91ff86cd9c29299a64f968ebb45846c485725f23" })
	use({ "saadparwaiz1/cmp_luasnip", commit="18095520391186d634a0045dacaa346291096566" })

	-- snippets
	use({ "L3MON4D3/LuaSnip", tag = "v1.1.0" })
	use({ "rafamadriz/friendly-snippets" })

	use({ "gpanders/editorconfig.nvim" })
	use({ "numToStr/Comment.nvim", tag = "v0.7.0" })
	use({ "mg979/vim-visual-multi", tag = "v0.5.8" })

	use({ "lewis6991/gitsigns.nvim", tag = "v0.5" })

	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" })
	use({ "akinsho/bufferline.nvim", tag = "v2.11.1" })
	use({ "Mofiqul/dracula.nvim", commit = "0b4f6e009867027caddc1f28a81d8a7da6a2b277" })
	use({ "kylechui/nvim-surround", tag = "v1.0.0" })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({
		"nvim-lualine/lualine.nvim",
		commit = "3325d5d43a7a2bc9baeef2b7e58e1d915278beaf",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = { { "nvim-lua/plenary.nvim" } } })
	use({
		"nvim-neo-tree/neo-tree.nvim",
		tag = "2.43",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	-- Dependencies
	use({ "nvim-lua/plenary.nvim", commit="4b7e52044bbb84242158d977a50c4cbcd85070c7" })
	use({ "MunifTanjim/nui.nvim", commit="d12a6977846b2fa978bff89b439e509320854e10" })
	use({ "kyazdani42/nvim-web-devicons" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
