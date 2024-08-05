return {
  {
    'm00qek/baleia.nvim',
    enabled = false,
    version = '*',
    config = function()
      vim.g.baleia = require('baleia').setup {}

      -- Command to colorize the current buffer
      vim.api.nvim_create_user_command('BaleiaColorize', function()
        vim.g.baleia.once(vim.api.nvim_get_current_buf())
      end, { bang = true })

      -- Command to show logs
      vim.api.nvim_create_user_command('BaleiaLogs', vim.g.baleia.logger.show, { bang = true })

      -- Automatically colorize when a new line is added
      vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
        pattern = '*.log',
        callback = function()
          vim.g.baleia.automatically(vim.api.nvim_get_current_buf())
        end,
      })
    end,
  },
  {
    'MTDL9/vim-log-highlighting',
    init = function()
      vim.api.nvim_create_autocmd('BufRead', {
        pattern = '*.dump',
        callback = function()
          vim.bo.filetype = 'log'
        end,
      })
    end,
  },
  {
    'fei6409/log-highlight.nvim',
    enabled = false,
    opts = {},
  },
}
