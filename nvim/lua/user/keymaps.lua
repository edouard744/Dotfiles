local keymap = require("user.lib.utils").keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>k", ":nohlsearch<CR>")
keymap("n", "<leader>Q", ":bufdo bdelete<CR>")

-- Allow gf to open non-existent files
keymap("", "gf", ":edit <cfile><CR>")

-- Reselect visual selection after indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap("v", "y", "myy`y")
keymap("v", "Y", "myY`y")

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Paste replace visual selection without copying it
keymap("v", "p", '"_dP') -- TODO: vim-pasta is breaking this :(

-- Easy insertion of a trailing ; or , from insert mode
keymap("i", ";;", "<Esc>A;<Esc>")
keymap("i", ",,", "<Esc>A,<Esc>")

-- Open the current file in the default program (on Mac this should just be just `open`)
keymap("n", "<leader>x", ":!open %<cr><cr>")

-- Disable annoying command line thing
keymap("n", "q:", ":q<CR>")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>")
keymap("n", "<C-Down>", ":resize -2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move text up and down
keymap("i", "<A-j>", "<Esc>:move .+1<CR>==gi")
keymap("i", "<A-k>", "<Esc>:move .-2<CR>==gi")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

keymap("n", "<leader>n", ":ASToggle<CR>", {})
keymap("n", ",", "^")
keymap("n", ";", "$")
vim.api.nvim_set_keymap(
	"n",
	"<F3>",
	":lua local save_pos = vim.fn.getpos('.') vim.cmd('normal! gg=G') vim.fn.setpos('.', save_pos)<CR>",
	{ noremap = true, silent = true }
)
