return {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    debounce_delay = 2000,
    enabled = true,
    condition = function(buf)
      local fn = vim.fn
      local utils = require("auto-save.utils.data")

      if
          fn.getbufvar(buf, "&modifiable") == 1 and
          -- change here is adding harpoon file type to exclusion list
          utils.not_in(fn.getbufvar(buf, "&filetype"), { "harpoon" }) then
        return true
      end
      return false
    end
  },

  config = function(_, opts)
    -- Charger et configurer le plugin
    require("auto-save").setup(opts)
    local group = vim.api.nvim_create_augroup('autosave', {})


    vim.api.nvim_create_autocmd('User', {
      pattern = 'AutoSaveEnable',
      group = group,
      callback = function(opts)
        vim.notify('Auto-Save activé ✅', vim.log.levels.INFO)
      end,
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'AutoSaveDisable',
      group = group,
      callback = function(opts)
        vim.notify('Auto-Save désactivé ❌', vim.log.levels.WARN)
      end,
    })
    vim.api.nvim_create_autocmd('User', {
      pattern = 'AutoSaveWritePost',
      group = group,
      callback = function(opts)
        if opts.data.saved_buffer ~= nil then
          local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
          local filename_only = vim.fn.fnamemodify(filename, ':t')
          vim.notify('AutoSave: saved ' .. filename_only, vim.log.levels.INFO)
        end
      end,
    })



    vim.keymap.set("n", "<leader>n", function()
      vim.cmd("ASToggle")
    end, { desc = "Toggle Auto-Save avec notification" })
  end,
}
