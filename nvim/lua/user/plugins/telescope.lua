-- Fuzzy finder

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-live-grep-args.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
        {
            "<leader>f",
            function()
                require("telescope.builtin").find_files()
            end,
        },
        {
            "<leader>F",
            function()
                require("telescope.builtin").find_files({ no_ignore = true, prompt_title = "All Files" })
            end,
        },
        {
            "<leader>e",
            function()
                require("telescope.builtin").buffers()
            end,
        },
        {
            "<leader>g",
            function()
                require("telescope").extensions.live_grep_args.live_grep_args()
            end,
        },
        {
            "<leader>p",
            function()
                require("telescope.builtin").help_tags()
            end,
        },
        {
            "<leader>s",
            function()
                require("telescope.builtin").lsp_document_symbols()
            end,
        },
        {
            "<leader>d",
            function()
                require("telescope.builtin").diagnostics()
            end,
            desc = "Afficher les erreurs"
        },
    },
    config = function()
        local actions = require("telescope.actions")


        require("telescope").setup({
            defaults = {
                path_display = { truncate = 1 },
                prompt_prefix = "   ",
                selection_caret = "  ",
                layout_config = {
                    prompt_position = "top",
                },
                preview = {
                    timeout = 200,
                },
                sorting_strategy = "ascending",
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<C-Down>"] = actions.cycle_history_next,
                        ["<C-Up>"] = actions.cycle_history_prev,
                    },
                },
                file_ignore_patterns = { ".git/" },
            },
            extensions = {
                live_grep_args = {
                    mappings = {
                        i = {
                            ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                            ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({
                                postfix = " --iglob ",
                            }),
                        },
                    },
                    additional_args = function()
                        return { "--no-ignore", "--hidden" } -- Inclut les fichiers cachés et ignorés
                    end,
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                buffers = {
                    sort_lastused = true,

                    ignore_current_buffer = true,
                    previewer = true,
                    layout_config = {
                        width = 150,
                    },
                },
                oldfiles = {
                    prompt_title = "History",
                },
                lsp_references = {
                    previewer = false,
                },
                lsp_definitions = {
                    previewer = false,
                },
                lsp_document_symbols = {
                    symbol_width = 55,
                },
            },
        })

        require("telescope").load_extension("fzf")
    end,
}
