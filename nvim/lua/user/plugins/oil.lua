return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
      require("oil").setup()
    end
  }
