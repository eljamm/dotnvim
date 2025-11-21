local ObsidianVault = vim.fn.expand '~' .. '/Documents/Notes/Obsidian/Productivity'

return {
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    -- ft = 'markdown',
    event = {
      -- -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      -- 'BufReadPre '
      --   .. ObsidianVault
      --   .. '/**.md',
      -- 'BufNewFile ' .. ObsidianVault .. '/**.md',

      'LazyFile',
      'VeryLazy',
    },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      ui = { enable = false },
      frontmatter = { enabled = false },
      legacy_commands = false,

      workspaces = {
        {
          name = 'Productivity',
          path = '~/Documents/Notes/Obsidian/Productivity',
        },
      },

      templates = {
        folder = '5 - Templates',
        date_format = '%Y-%m-%d-%a',
        time_format = '%H:%M',
      },
    },
  },
  {
    'efirlus/quickadd.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('quickadd').setup {
        daily_note_path = ObsidianVault .. '/1 - Temporary',
        todo_path = ObsidianVault .. '/1 - Temporary/TODO.md',
      }
    end,
  },
}
