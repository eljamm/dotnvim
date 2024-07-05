return {
  {
    'olimorris/persisted.nvim',
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
  {
    'stevearc/resession.nvim',
    enabled = false,
    event = 'VimEnter',
    config = true,
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
    },
    init = function()
      -- WIP: barbar save buffer position
      require('resession').add_hook('pre_save', function()
        vim.opt.sessionoptions:append 'globals'
        vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
      end)

      -- Create one session per git branch
      local function get_session_name()
        local name = vim.fn.getcwd()
        local branch = vim.trim(vim.fn.system 'git branch --show-current')
        if vim.v.shell_error == 0 then
          return name .. branch
        else
          return name
        end
      end
      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          local resession = require 'resession'
          -- Only load the session if nvim was started with no args
          if vim.fn.argc(-1) == 0 then
            resession.load(get_session_name(), { dir = 'dirsession', silence_errors = true })
          end
        end,
      })
      vim.api.nvim_create_autocmd('VimLeavePre', {
        callback = function()
          local resession = require 'resession'
          resession.save(get_session_name(), { dir = 'dirsession', notify = false })
        end,
      })

      -- Keymaps
      vim.keymap.set('n', '<leader>ss', require('resession').save_tab)
      vim.keymap.set('n', '<leader>sl', require('resession').load)
    end,
  },
}
