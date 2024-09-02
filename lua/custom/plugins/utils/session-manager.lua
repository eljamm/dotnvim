return {
  {
    'folke/persistence.nvim',
    enabled = false,
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
  {
    'olimorris/persisted.nvim',
    lazy = false,
    opts = {
      autoload = true,
      use_git_branch = true,
      should_save = function()
        -- dashboard
        if vim.bo.filetype == ('alpha' or 'dashboard') then
          return false
        end
        -- empty buffer
        if vim.bo.filetype == '' then
          return false
        end
        -- git commit
        if vim.api.nvim_buf_get_name(0):match 'COMMIT_EDITMSG' then
          return false
        end
        -- session launched from file
        if #vim.fn.argv() ~= 0 then
          return false
        end
        return true
      end,
    },
    config = function(_, opts)
      local persisted = require 'persisted'
      -- git branching from directories that are not the CWD
      persisted.branch = function()
        local branch = vim.fn.systemlist('git branch --show-current')[1]
        return vim.v.shell_error == 0 and branch or nil
      end
      persisted.setup(opts)
    end,
    init = function()
      -- barbar integration: save buffer order
      vim.opt.sessionoptions:append 'globals'
      vim.api.nvim_create_autocmd({ 'User' }, {
        pattern = 'PersistedSavePre',
        group = vim.api.nvim_create_augroup('PersistedHooks', {}),
        callback = function()
          vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
        end,
      })
    end,
  },
}
