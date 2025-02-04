return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
  end,
-- if not open :NvimTreeFindFileToggle, if open :NvimTreeFocus and if already focused :NvimTreeFindFileToggle
vim.keymap.set('n', '<Leader>&', function()
  local view = require('nvim-tree.view')
  if view.is_visible() then
    if vim.api.nvim_get_current_win() == view.get_winnr() then
      vim.cmd('NvimTreeFindFileToggle')
    else
      vim.cmd('NvimTreeFocus')
    end
  else
    vim.cmd('NvimTreeFindFileToggle')
  end
end, { silent = true })}
  

