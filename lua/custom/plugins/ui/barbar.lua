return {
  'romgrk/barbar.nvim',
  event = 'BufEnter',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false

    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Move to previous/next
    map('n', '<A-j>', '<Cmd>BufferPrevious<CR>', opts)
    map('n', '<A-k>', '<Cmd>BufferNext<CR>', opts)
    -- Re-order to previous/next
    map('n', '<A-S-j>', '<Cmd>BufferMovePrevious<CR>', opts)
    map('n', '<A-S-k>', '<Cmd>BufferMoveNext<CR>', opts)
    -- Goto buffer in position...
    map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
    map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
    map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
    map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
    map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
    map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
    map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
    map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
    map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
    map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
    -- Pin/unpin buffer
    map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
    -- Close buffer
    map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
    -- Wipeout buffer
    --                 :BufferWipeout
    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight
    -- Magic buffer-picking mode
    map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
    -- Sort automatically by...
    map(
      'n',
      '<Space>bon',
      '<Cmd>BufferOrderByBufferNumber<CR>',
      { desc = '[B]uffer [O]rder [N]umber', noremap = true, silent = true }
    )
    map(
      'n',
      '<Space>bod',
      '<Cmd>BufferOrderByDirectory<CR>',
      { desc = '[B]uffer [O]rder [D]irectory', noremap = true, silent = true }
    )
    map(
      'n',
      '<Space>bol',
      '<Cmd>BufferOrderByLanguage<CR>',
      { desc = '[B]uffer [O]rder [L]anguage', noremap = true, silent = true }
    )
    map(
      'n',
      '<Space>bow',
      '<Cmd>BufferOrderByWindowNumber<CR>',
      { desc = '[B]uffer [O]rder [W]indow', noremap = true, silent = true }
    )

    -- Other:
    -- :BarbarEnable - enables barbar (enabled by default)
    -- :BarbarDisable - very bad command, should never be used
  end,
  opts = {
    -- Enable/disable animations
    animation = false,

    -- -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
    -- hide = { extensions = true },

    -- If true, new buffers will be inserted at the start/end of the list.
    -- Default is to insert after current buffer.
    insert_at_end = false,
    insert_at_start = false,

    -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
    -- Valid options are 'left' (the default), 'previous', and 'right'
    focus_on_close = 'right',

    sidebar_filetypes = {
      -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
      NvimTree = true,
      -- Or, specify the text used for the offset:
      undotree = {
        text = 'undotree',
        align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
      },
      -- Or, specify the event which the sidebar executes when leaving:
      ['neo-tree'] = { event = 'BufWipeout' },
      -- Or, specify all three
      Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' },
    },
    -- New buffer letters are assigned in this order. This order is
    -- optimal for the QWERTZ keyboard layout but might need adjustment
    -- for other layouts.
    letters = 'asdfjklöghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
