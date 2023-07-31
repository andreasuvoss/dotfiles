return {
    'Mofiqul/dracula.nvim',
    opts = {},
    -- Optional dependencies
    lazy = false,
    config = function()
        vim.cmd[[colorscheme dracula]]
    end
}
