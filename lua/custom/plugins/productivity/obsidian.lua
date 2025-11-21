local ObsidianVault = vim.fn.expand '~' .. '/Documents/Notes/Obsidian/Productivity'
local ankiNotesDir = { notes_subdir = '6 - Notes/Anki/_tmp' }

return {
  {
    'obsidian-nvim/obsidian.nvim',
    -- -- switch back to releases after the bug with rename is fixed:
    -- -- https://github.com/obsidian-nvim/obsidian.nvim/issues/476
    -- version = '*',
    event = { 'LazyFile', 'VeryLazy' },
    opts = {
      ui = { enable = false },
      frontmatter = { enabled = false },
      legacy_commands = false,

      workspaces = {
        {
          name = 'Productivity',
          path = ObsidianVault,
        },
      },

      -- https://github.com/obsidian-nvim/obsidian.nvim/wiki/Template
      templates = {
        folder = '5 - Templates',
        date_format = '%Y-%m-%d-%a',
        time_format = '%H:%M',
        customizations = {
          ['Anki Note'] = ankiNotesDir,
          ['Anki (nixlib)'] = ankiNotesDir,
          ['Anki (french)'] = ankiNotesDir,
        },
      },

      daily_notes = {
        folder = '1 - Temporary',
        workdays_only = false,
        default_tags = {},
      },

      attachments = {
        img_folder = 'Media',
      },
    },
    keys = {
      -- Toplevel
      { '<leader>od', '<CMD>Obsidian today<CR>', desc = '[O]bsidian [D]ay' },
      { '<leader>ol', '<CMD>Obsidian dailies<CR>', desc = '[O]bsidian Dailies [L]ist' },
      { '<leader>og', '<CMD>Obsidian search<CR>', desc = '[O]bsidian [G]rep' },
      { '<leader>of', '<CMD>Obsidian quick_switch<CR>', desc = '[O]bsidian [F]iles' },
      { '<leader>om', '<CMD>Obsidian open<CR>', desc = '[O]bsidian [M]ain Window' },
      { '<leader>ot', '<CMD>Obsidian new_from_template<CR>', desc = '[O]bsidian [T]emplate' },
      { '<leader>ow', '<CMD>Obsidian workspace<CR>', desc = '[O]bsidian [W]orkspace' },

      -- Notes
      { '<leader>oo', '<CMD>Obsidian follow_link<CR>', desc = '[O]bsidian [O]pen Link' },
      { '<leader>ok', '<CMD>Obsidian links<CR>', desc = '[O]bsidian [O]pen Links' },
      { '<leader>op', '<CMD>Obsidian paste_img<CR>', desc = '[O]bsidian [P]paste Image' },
      { '<leader>or', '<CMD>Obsidian backlinks<CR>', desc = '[O]bsidian [R]references' },
      { '<leader>on', '<CMD>Obsidian rename<CR>', desc = '[O]bsidian Re[N]ame' },

      -- TODO:
      -- https://github.com/obsidian-nvim/obsidian.nvim/tree/v3.14.5?tab=readme-ov-file#visual-mode-commands
    },
  },
  {
    'efirlus/quickadd.nvim',
    enabled = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('quickadd').setup {
        daily_note_path = ObsidianVault .. '/1 - Temporary',
        todo_path = ObsidianVault .. '/1 - Temporary/TODO.md',
      }
    end,
  },
}
