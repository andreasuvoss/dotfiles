local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
	return
end

local home = os.getenv('HOME')

--dashboard.setup()
--
dashboard.preview_file_height = 11
dashboard.preview_file_width = 70
dashboard.custom_center = {
	{
		icon = "  ",
		desc = "Recently latest session                 ",
		shortcut = "SPC s l",
		action = "SessionLoad",
	},
	-- {
	-- 	icon = "  ",
	-- 	desc = "Recently opened files                   ",
	-- 	action = "DashboardFindHistory",
	-- 	shortcut = "SPC f h",
	-- },
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC f f",
	},
	-- {
	-- 	icon = "  ",
	-- 	desc = "File Browser                            ",
	-- 	action = "Telescope file_browser",
	-- 	shortcut = "SPC f b",
	-- },
	{
		icon = "  ",
		desc = "Find  word                              ",
		action = "Telescope live_grep",
		shortcut = "SPC f w",
	},
	-- {
	-- 	icon = "  ",
	-- 	desc = "Open Personal dotfiles                  ",
	-- 	action = "Telescope dotfiles path=" .. home .. "/.dotfiles",
	-- 	shortcut = "SPC f d",
	-- },
}
