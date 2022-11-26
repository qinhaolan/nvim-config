local status, leap = pcall(require, "leap")
if not status then
	vim.notify("没有找到 leap")
	return
end

leap.add_default_mappings()
leap.opts.highlight_unlabeled_phase_one_targets = true
vim.keymap.del({ "x", "o" }, "x")
vim.keymap.del({ "x", "o" }, "X")
-- To set alternative keys for "exclusive" selection:
vim.keymap.set({ "x", "o" }, "ss", "<Plug>(leap-forward-till)")
vim.keymap.set({ "x", "o" }, "SS", "<Plug>(leap-backward-till)")
