local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

vim.opt.termguicolors = true
bufferline.setup {
    options = {
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        offsets = { { filetype = "neo-tree", text = "Explorer" } },
        separator_style = "thin",
        tab_size = 25,
    }
}
