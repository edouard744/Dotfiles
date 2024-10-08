return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	dependencies = {
		{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			config = function()
				require("ts_context_commentstring").setup({
					enable_autocmd = false,
					custom_calculation = function(node, language_tree)
						if vim.bo.filetype == "blade" and language_tree._lang ~= "javascript" then
							return "{{-- %s --}}"
						end
					end,
				})
			end,
		},
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"arduino",
			"bash",
			"php",
			"blade",
			"comment",
			"css",
			"diff",
			"dockerfile",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"go",
			"html",
			"http",
			"ini",
			"javascript",
			"json",
			"jsonc",
			"lua",
			"make",
			"markdown",
			"passwd",
			"php",
			"phpdoc",
			"python",
			"regex",
			"ruby",
			"rust",
			"sql",
			"svelte",
			"typescript",
			"vim",
			"vue",
			"xml",
			"yaml",
		},
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
			disable = { "yaml" },
		},
		rainbow = {
			enable = true,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["if"] = "@function.inner",
					["af"] = "@function.outer",
					["ia"] = "@parameter.inner",
					["aa"] = "@parameter.outer",
				},
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)

		-- Configuration pour le parser blade
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}
		vim.filetype.add({
			pattern = {
				[".*%.blade%.php"] = "blade",
			},
		})

		require("nvim-ts-autotag").setup({
			opts = {
				-- Defaults
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
			-- Also override individual filetype configs, these take priority.
			-- Empty by default, useful if one of the "opts" global settings
			-- doesn't work well in a specific filetype
			per_filetype = {
				["html"] = {
					enable_close = false,
				},
			},
		})

		vim.g.skip_ts_context_commentstring_module = true
	end,
}
