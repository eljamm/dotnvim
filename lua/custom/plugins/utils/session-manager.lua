return {
  -- TODO: clean up
  {
    'olimorris/persisted.nvim',
    enabled = false,
    event = 'VimEnter',
    opts = {
      autoload = false,
      use_git_branch = true,
      default_branch = 'master',
      ignored_dirs = {
        { '~/', exact = true },
      },
      should_autosave = function()
        if vim.bo.filetype == 'alpha' then
          return false
        end
        if vim.bo.filetype == '' then
          return false
        end
        if vim.api.nvim_buf_get_name(0):match 'COMMIT_EDITMSG' then
          return false
        end

        return true
      end,
    },
    priority = 500,
  },
  -- TODO: clean up
  {
    'stevearc/resession.nvim',
    enabled = false,
    opts = {
      extensions = {
        grapple = {},
      },
      buf_filter = function(bufnr)
        local buftype = vim.bo[bufnr].buftype
        if buftype == 'help' then
          return true
        end
        if buftype ~= '' and buftype ~= 'acwrite' then
          return false
        end
        if vim.api.nvim_buf_get_name(bufnr) == '' then
          return false
        end
        if buftype == 'alpha' then
          return false
        end
        if buftype == 'gitcommit' then
          return false
        end
        if vim.api.nvim_buf_get_name(0):match 'COMMIT_EDITMSG' then
          return false
        end
        return vim.bo[bufnr].buflisted
      end,
      options = { 'buffers', 'curdir', 'globals', 'tabpages', 'winsize' },
    },
    init = function()
      local resession = require 'resession'
      resession.setup()

      -- Resession does NOTHING automagically, so we have to set up some keymaps
      vim.keymap.set('n', '<leader>ss', resession.save)
      vim.keymap.set('n', '<leader>sl', resession.load)
      vim.keymap.set('n', '<leader>sd', resession.delete)

      vim.api.nvim_create_autocmd('VimLeavePre', {
        callback = function()
          resession.save 'last'
        end,
      })
      resession.add_hook('pre_save', function()
        vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
      end)
    end,
  },
}
