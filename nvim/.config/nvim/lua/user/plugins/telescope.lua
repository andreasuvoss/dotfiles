return {
    'nvim-telescope/telescope.nvim',
    opts = {},
    -- Optional dependencies
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup {
            path_display = { "smart" },
            pickers = {
                live_grep = {
                    file_ignore_patterns = { 'node_modules', '.git', '.venv' },
                    additional_args = function(_)
                        return { "--hidden" }
                    end
                },
                find_files = {
                    find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
                    -- previewer = false
                }
            }
        }
    end
}
