local modules = {
    "user.autocommands",
	"user.theme",
	"user.options",
	"user.plugins",
	"user.keybindings",
	"user.telescope",
	"user.surround",
    "user.neotree",
    "user.bufferline",
    "user.lualine",
    "user.treesitter",
    "user.cmp",
    "user.lsp",
    -- "user.startup",
    "user.comment",
    "user.gitsigns",
}

for k, v in pairs(modules) do
	package.loaded[v] = nil
	require(v)
end
