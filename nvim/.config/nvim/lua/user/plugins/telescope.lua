return {
    'nvim-telescope/telescope.nvim',
    opts = {},
    -- Optional dependencies
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup{
path_display = { "smart" }
        }
    end
  }
