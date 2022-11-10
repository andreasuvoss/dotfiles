local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)

    -- Treesitter, Better syntax highlighting.
    -- https://github.com/nvim-treesitter/nvim-treesitter
    use { "nvim-treesitter/nvim-treesitter", commit = "8ec59aee8097c64fcf27d1dbd77ea181c50846c5",
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- Treesitter Rainbow, Making pair brackets same color.
    -- https://github.com/p00f/nvim-ts-rainbow
    use { "p00f/nvim-ts-rainbow", commit = "fad8badcd9baa4deb2cf2a5376ab412a1ba41797"}
	use { "kyazdani42/nvim-web-devicons" }
    use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }
    use { "akinsho/bufferline.nvim", tag = "v2.11.1" }
	use { 'Mofiqul/dracula.nvim', commit = '0b4f6e009867027caddc1f28a81d8a7da6a2b277' }
    use { "kylechui/nvim-surround", tag = "v1.0.0" }
    use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
    use {
        'nvim-lualine/lualine.nvim', commit = "3325d5d43a7a2bc9baeef2b7e58e1d915278beaf",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
	use { 'nvim-telescope/telescope.nvim', tag ='0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } } 
	}
	use { 'nvim-neo-tree/neo-tree.nvim', tag = '2.43', 
		requires = { 
			"nvim-lua/plenary.nvim", 
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      			"MunifTanjim/nui.nvim",
		} 
	}

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
