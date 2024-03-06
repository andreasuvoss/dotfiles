return {
    'kylechui/nvim-surround',
    opts = {},
    lazy = false,
    config = function()
        require("nvim-surround").setup()
    end
}
