local modules = {
	"user.theme",
	"user.options",
	"user.plugins",
	"user.keybindings",
	"user.telescope",
	"user.surround",
}

for k, v in pairs(modules) do
	package.loaded[v] = nil
	require(v)
end
