return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		local db = require("dashboard")
		require("telescope")
		db.setup({
			theme = "hyper",
			config = {
				header = {
					"Welcome to Neovim",
				},
				center = {
					{
						icon = "  ",
						desc = "Recently latest session                  ",
						action = "SessionLoad",
						shortcut = "SPC s l",
					},
					{
						icon = "  ",
						desc = "Recently opened files                   ",
						action = function()
							require("telescope.builtin").oldfiles({ cwd_only = true })
						end,
						shortcut = "SPC f h",
					},
					{
						icon = "  ",
						desc = "Find  File                              ",
						action = function()
							require("telescope.builtin").find_files({
								cwd = "/Users/edouardwillems/Code/github/dotfiles",
							})
						end,
						shortcut = "SPC f f",
					},
					{
						icon = "  ",
						desc = "File Browser                            ",
						action = function()
							require("telescope").extensions.file_browser.file_browser({
								cwd = "/Users/edouardwillems/Code/github/dotfiles",
							})
						end,
						shortcut = "SPC f b",
					},
					{
						icon = "  ",
						desc = "Find  word                              ",
						action = function()
							require("telescope.builtin").live_grep()
						end,
						shortcut = "SPC f w",
					},
				},
				footer = {}, -- your footer
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
