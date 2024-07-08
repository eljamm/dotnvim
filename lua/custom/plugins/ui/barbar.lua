local map = vim.api.nvim_set_keymap

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local exec_autocmds = vim.api.nvim_exec_autocmds

local opts = function(desc)
  return { desc = desc, noremap = true, silent = true }
end

return {
  'romgrk/barbar.nvim',
  event = 'BufEnter',
  dependencies = {
    -- Optional
    'lewis6991/gitsigns.nvim', -- git status
    'nvim-tree/nvim-web-devicons', -- file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false

    -- Move to previous/next
    map('n', '<A-j>', '<Cmd>BufferPrevious<CR>', opts 'Go to Previous Buffer')
    map('n', '<A-k>', '<Cmd>BufferNext<CR>', opts 'Go to Next Buffer')
    -- Re-order to previous/next
    map('n', '<A-S-j>', '<Cmd>BufferMovePrevious<CR>', opts 'Move Buffer Left')
    map('n', '<A-S-k>', '<Cmd>BufferMoveNext<CR>', opts 'Move Buffer Right')
    -- Goto buffer in position...
    map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts 'Go to Buffer 1')
    map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts 'Go to Buffer 2')
    map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts 'Go to Buffer 3')
    map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts 'Go to Buffer 4')
    map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts 'Go to Buffer 5')
    map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts 'Go to Buffer 6')
    map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts 'Go to Buffer 7')
    map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts 'Go to Buffer 8')
    map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts 'Go to Buffer 9')
    map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts 'Go to Last Buffer')
    -- Pin/unpin buffer
    map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts '[P]in Buffer')
    -- Close buffer
    map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts '[C]lose Buffer')
    map('n', '<A-x>', '<Cmd>BufferClose!<CR>', opts 'Exit Buffer')
    -- Wipeout buffer
    --                 :BufferWipeout
    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight
    -- Magic buffer-picking mode
    map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts '[P]ick Buffer')
    -- Sort automatically by...
    map('n', '<Space>bon', '<Cmd>BufferOrderByBufferNumber<CR>', opts '[B]uffer [O]rder [N]umber')
    map('n', '<Space>bod', '<Cmd>BufferOrderByDirectory<CR>', opts '[B]uffer [O]rder [D]irectory')
    map('n', '<Space>bol', '<Cmd>BufferOrderByLanguage<CR>', opts '[B]uffer [O]rder [L]anguage')
    map('n', '<Space>bow', '<Cmd>BufferOrderByWindowNumber<CR>', opts '[B]uffer [O]rder [W]indow')

    -- Other:
    -- :BarbarEnable - enables barbar (enabled by default)
    -- :BarbarDisable - very bad command, should never be used

    -- Save buffer location with persisted.nvim
    vim.opt.sessionoptions:append 'globals'
    autocmd({ 'User' }, {
      pattern = 'PersistedSavePre',
      group = augroup('PersistedHooks', {}),
      callback = function()
        exec_autocmds('User', { pattern = 'SessionSavePre' })
      end,
    })
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
