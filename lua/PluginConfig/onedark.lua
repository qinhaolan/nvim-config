local status, onedark = pcall(require, "onedark")
if not status then
	vim.notify("没有找到 onedark")
	return
end
onedark.setup({
	function_style = "italic",
	sidebars = { "qf", "vista_kind", "terminal", "packer" },

	-- Change the "hint" color to the "orange0" color, and make the "error" color bright red
	colors = { hint = "orange0", error = "#ff0000" },

	-- Overwrite the highlight groups
	overrides = function(c)
		return {
			htmlTag = { fg = c.red0, bg = "#282c34", sp = c.hint, style = "underline" },
			DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
			-- this will remove the highlight groups
			TSField = {},
		}
	end,
})
