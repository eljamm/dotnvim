local ObsidianVault = vim.fn.expand '~' .. '/Documents/Notes/Obsidian/Productivity'

return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = false,
  -- ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    'BufReadPre '
      .. ObsidianVault
      .. '/**.md',
    'BufNewFile ' .. ObsidianVault .. '/**.md',
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    ui = { enable = false },
    disable_frontmatter = true,

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
}
