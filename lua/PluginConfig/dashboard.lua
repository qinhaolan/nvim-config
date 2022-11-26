local status, db = pcall(require, "dashboard")
if not status then
	vim.notify("没有找到 dashboard")
	return
end

--local path = vim.fn.stdpath("data")
-- macos
--db.preview_command = 'cat | lolcat -F 0.3'
-- linux
--db.preview_command = 'ueberzug'
--
--db.preview_file_path = home .. '/static/neovim.cat'
--db.preview_file_height = 11
--db.preview_file_width = 70
db.custom_center = {
	{
		icon = "  ",
		desc = "Projects                            ",
		action = "Telescope projects",
	},
	{
		icon = "  ",
		desc = "Recently files                      ",
		action = "Telescope oldfiles",
	},
	{
		icon = "  ",
		desc = "Edit keybindings                    ",
		action = "edit ~/.config/nvim/lua/keybindings.lua",
	},
	{
		icon = "  ",
		desc = "Edit Projects                       ",
		action = "edit ~/.local/share/nvim/project_nvim/project_history",
	},
}
db.custom_header = {
	[[]],
	[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
	[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
	[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
	[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
	[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
	[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
	[[                                                   ]],
	[[                [ version : 1.0.0 ]                ]],
}
