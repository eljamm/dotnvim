return {
  { 'tpope/vim-fugitive' },

  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional
      'sindrets/diffview.nvim', -- diff integration
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
    cmd = { 'Neogit', 'NeogitResetState' },
    keys = { { '<leader>gn', '<CMD>Neogit<CR>', desc = '[N]eogit' } },
  },

  {
    'sindrets/diffview.nvim',
    opts = {},
    cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewToggleFiles',
      'DiffviewFocusFiles',
      'DiffviewRefresh',
      'DiffviewFileHistory',
    },
    keys = {
      { '<leader>gd', '<CMD>DiffviewOpen<CR>', desc = '[D]iffview' },
    },
  },

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = 'LazyFile',
    opts = {
      watch_gitdir = { interval = 1000, follow_files = true },
      update_debounce = 100,
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '󰍵' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '│' },
      },
      -- TODO: slows things down?
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end)

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = '[S]tage' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = '[R]eset' })
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Git: [H]unk [S]tage' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Git: [H]unk [R]eset' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = '[S]tage Buffer' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = '[R]est Buffer' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = '[P]review' })
        map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = '[I]nline' })

        map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = '[B]lame' })
        -- map('n', '<leader>gd', gitsigns.diffthis, { desc = '[D]iff' })
        map('n', '<leader>gD', '<CMD>Gitsigns diffthis "~"<CR>', { desc = '[D]iff Changed' })
        map('n', '<leader>gr', gitsigns.toggle_deleted, { desc = '[R]removed' })
        map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[P]review Hunk' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = '', silent = true })
      end,
    },
  },
}
