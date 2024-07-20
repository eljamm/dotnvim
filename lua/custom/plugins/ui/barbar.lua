return {
  {
    'romgrk/barbar.nvim',
    event = 'BufEnter',
    dependencies = {
      -- Optional
      'lewis6991/gitsigns.nvim', -- git status
      'nvim-tree/nvim-web-devicons', -- file icons
    },
    keys = {
      -- Move to previous/next
      { '<A-j>', '<CMD>BufferPrevious<CR>', desc = 'Go to Previous Buffer', noremap = true, silent = true },
      { '<A-k>', '<CMD>BufferNext<CR>', desc = 'Go to Next Buffer', noremap = true, silent = true },
      -- Re-order to previous/next
      { '<A-S-j>', '<CMD>BufferMovePrevious<CR>', desc = 'Go to Previous Buffer', noremap = true, silent = true },
      { '<A-S-k>', '<CMD>BufferMoveNext<CR>', desc = 'Go to Next Buffer', noremap = true, silent = true },
      -- Goto buffer in position...
      { '<A-1>', '<Cmd>BufferGoto 1<CR>', desc = 'Go to Buffer 1', noremap = true, silent = true },
      { '<A-2>', '<Cmd>BufferGoto 2<CR>', desc = 'Go to Buffer 2', noremap = true, silent = true },
      { '<A-3>', '<Cmd>BufferGoto 3<CR>', desc = 'Go to Buffer 3', noremap = true, silent = true },
      { '<A-4>', '<Cmd>BufferGoto 4<CR>', desc = 'Go to Buffer 4', noremap = true, silent = true },
      { '<A-5>', '<Cmd>BufferGoto 5<CR>', desc = 'Go to Buffer 5', noremap = true, silent = true },
      { '<A-6>', '<Cmd>BufferGoto 6<CR>', desc = 'Go to Buffer 6', noremap = true, silent = true },
      { '<A-7>', '<Cmd>BufferGoto 7<CR>', desc = 'Go to Buffer 7', noremap = true, silent = true },
      { '<A-8>', '<Cmd>BufferGoto 8<CR>', desc = 'Go to Buffer 8', noremap = true, silent = true },
      { '<A-9>', '<Cmd>BufferGoto 9<CR>', desc = 'Go to Buffer 9', noremap = true, silent = true },
      { '<A-0>', '<Cmd>BufferLast<CR>', desc = 'Go to Last Buffer', noremap = true, silent = true },
      -- Pin/unpin buffer
      { '<A-p>', '<Cmd>BufferPin<CR>', desc = '[P]in Buffer', noremap = true, silent = true },
      -- Close buffer
      { '<A-c>', '<Cmd>BufferClose<CR>', desc = '[C]lose Buffer', noremap = true, silent = true },
      { '<A-x>', '<Cmd>BufferClose!<CR>', desc = 'Exit Buffer', noremap = true, silent = true },
      -- Wipeout buffer
      --                 :BufferWipeout
      -- Close commands
      --                 :BufferCloseAllButCurrent
      --                 :BufferCloseAllButPinned
      --                 :BufferCloseAllButCurrentOrPinned
      --                 :BufferCloseBuffersLeft
      --                 :BufferCloseBuffersRight
      -- Magic buffer-picking mode
      { '<C-p>', '<Cmd>BufferPick<CR>', desc = '[P]ick Buffer', noremap = true, silent = true },
      -- Sort automatically by...
      --stylua: ignore start
      { '<Space>bon', '<Cmd>BufferOrderByBufferNumber<CR>', desc = '[B]uffer [O]rder [N]umber', noremap = true, silent = true  },
      { '<Space>bod', '<Cmd>BufferOrderByDirectory<CR>', desc = '[B]uffer [O]rder [D]irectory', noremap = true, silent = true  },
      { '<Space>bol', '<Cmd>BufferOrderByLanguage<CR>', desc = '[B]uffer [O]rder [L]anguage', noremap = true, silent = true  },
      { '<Space>bow', '<Cmd>BufferOrderByWindowNumber<CR>', desc = '[B]uffer [O]rder [W]indow', noremap = true, silent = true  },
      --stylua: ignore end
      -- Other:
      -- :BarbarEnable - enables barbar (enabled by default)
      -- :BarbarDisable - very bad command, should never be used
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- Enable/disable animations
      animation = false,

      -- -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
      -- hide = { extensions = true },

      -- If true, new buffers will be inserted at the start/end of the list.
      -- Default is to insert after current buffer.
      insert_at_end = true,
      insert_at_start = false,

      -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
      -- Valid options are 'left' (the default), 'previous', and 'right'
      focus_on_close = 'right',

      sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
        NvimTree = true,
        -- Or, specify the event which the sidebar executes when leaving:
        ['neo-tree'] = { event = 'BufWipeout' },
        -- -- Or, specify the text used for the offset:
        -- undotree = {
        --   text = 'undotree',
        --   align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
        -- },
        -- -- Or, specify all three
        -- Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' },
      },
      -- New buffer letters are assigned in this order. This order is
      -- optimal for the QWERTZ keyboard layout but might need adjustment
      -- for other layouts.
      letters = 'asdfjklöghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
