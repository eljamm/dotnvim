return {
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    opts = { options = vim.opt.sessionoptions },
    init = function()
      -- don't save session if launched from file
      if #vim.fn.argv() ~= 0 then
        require('persistence').stop()
      end

      -- barbar integration: save buffer order
      vim.opt.sessionoptions:append 'globals'
      vim.api.nvim_create_autocmd({ 'User' }, {
        pattern = 'PersistenceSavePre',
        callback = function()
          vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
        end,
      })

      -- keymaps
      vim.keymap.set('n', '<leader>ss', function()
        require('persistence').select()
      end, { desc = '[S]earch [S]essions' })
    end,
  },
}
