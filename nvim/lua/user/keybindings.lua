-- Wrapper for mapping keybindings
function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--

-- Set leader key to ,
map("", ",", "<Nop>")
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Custom keybinds
--map("n", "<C-t>", ":NeoTreeFocusToggle<CR>")
map("n", "<leader>e", ":NeoTreeFocusToggle<CR>")
map("n", "<leader>ff", ":Telescope find_files<CR>")

-- Move better between vertical splits
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
