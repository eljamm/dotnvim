return {
  'romgrk/barbar.nvim',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    -- Set barbar's options
    require 'bufferline'.setup {
      -- Enable/disable animations
      animation = true,

      -- Enable/disable auto-hiding the tab bar when there is a single buffer
      auto_hide = true,

      -- Enable/disable current/total tabpages indicator (top right corner)
      tabpages = true,

      -- Enable/disable close button
      closable = true,

      -- Enables/disable clickable tabs
      --  - left-click: go to buffer
      --  - middle-click: delete buffer
      clickable = true,

      -- Excludes buffers from the tabline
      --exclude_ft = { 'javascript' },
      --exclude_name = { 'package.json' },

      -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
      -- Valid options are 'left' (the default) and 'right'
      focus_on_close = 'left',

      -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
      hide = { extensions = true, inactive = false },

      -- Disable highlighting alternate buffers
      highlight_alternate = false,

      -- Disable highlighting file icons in inactive buffers
      highlight_inactive_file_icons = false,

      -- Enable highlighting visible buffers
      highlight_visible = true,

      icons = {
        -- Configure the base icons on the bufferline.
        buffer_index = true,
        buffer_number = false,
        button = '',
        -- Enables / disables diagnostic symbols
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = ' ' },
          [vim.diagnostic.severity.WARN] = { enabled = false },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = true },
        },
        filetype = {
          -- Sets the icon's highlight group.
          -- If false, will use nvim-web-devicons colors
          custom_colors = false,

          -- Requires `nvim-web-devicons` if `true`
          enabled = true,
        },
        separator = { left = '▎', right = '' },

        -- Configure the icons on the bufferline when modified or pinned.
        -- Supports all the base icon options.
        modified = { button = '●' },
        pinned = { button = '' },

        -- Configure the icons on the bufferline based on the visibility of a buffer.
        -- Supports all the base icon options, plus `modified` and `pinned`.
        alternate = { filetype = { enabled = false } },
        current = { buffer_index = true },
        inactive = { button = '×' },
        visible = { modified = { buffer_number = false } },
      },

      -- If true, new buffers will be inserted at the start/end of the list.
      -- Default is to insert after current buffer.
      insert_at_end = false,
      insert_at_start = false,

      -- Sets the maximum padding width with which to surround each tab
      maximum_padding = 1,

      -- Sets the minimum padding width with which to surround each tab
      minimum_padding = 1,

      -- Sets the maximum buffer name length.
      maximum_length = 30,

      -- If set, the letters for each buffer in buffer-pick mode will be
      -- assigned based on their name. Otherwise or in case all letters are
      -- already assigned, the behavior is to assign letters in order of
      -- usability (see order below)
      semantic_letters = true,

      -- New buffer letters are assigned in this order. This order is
      -- optimal for the qwerty keyboard layout but might need adjustement
      -- for other layouts.
      letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

      -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
      -- where X is the buffer number. But only a static string is accepted here.
      no_name_title = nil,
    }
  end,
  keys = {
    -- Move to previous/next
    { '<A-j>',      '<Cmd>BufferPrevious<CR>',            desc = "Move to Previous Buffer" },
    { '<A-k>',      '<Cmd>BufferNext<CR>',                desc = "Move to Next Buffer" },
    -- Re-order to previous/next
    { '<A-<>',      '<Cmd>BufferMovePrevious<CR>',        desc = "Move Buffer Left" },
    { '<A->>',      '<Cmd>BufferMoveNext<CR>',            desc = "Move Buffer Right" },
    -- Goto buffer in position...
    { '<A-1>',      '<Cmd>BufferGoto 1<CR>',              desc = "Go to Buffer 1" },
    { '<A-2>',      '<Cmd>BufferGoto 2<CR>',              desc = "Go to Buffer 2" },
    { '<A-3>',      '<Cmd>BufferGoto 3<CR>',              desc = "Go to Buffer 3" },
    { '<A-4>',      '<Cmd>BufferGoto 4<CR>',              desc = "Go to Buffer 4" },
    { '<A-5>',      '<Cmd>BufferGoto 5<CR>',              desc = "Go to Buffer 5" },
    { '<A-6>',      '<Cmd>BufferGoto 6<CR>',              desc = "Go to Buffer 6" },
    { '<A-7>',      '<Cmd>BufferGoto 7<CR>',              desc = "Go to Buffer 7" },
    { '<A-8>',      '<Cmd>BufferGoto 8<CR>',              desc = "Go to Buffer 8" },
    { '<A-9>',      '<Cmd>BufferGoto 9<CR>',              desc = "Go to Buffer 9" },
    { '<A-0>',      '<Cmd>BufferLast<CR>',                desc = "Go to Last Buffer" },
    -- Pin/unpin buffer
    { '<A-p>',      '<Cmd>BufferPin<CR>',                 desc = "Pin/unpin Buffer" },
    -- Close buffer
    { '<A-c>',      '<Cmd>BufferClose<CR>',               desc = "Close Buffer" },
    -- Wipeout buffer
    --                 :BufferWipeout
    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight
    -- Magic buffer-picking mode
    { '<leader>p',  '<Cmd>BufferPick<CR>',                desc = "Pick Buffer" },
    -- Sort automatically by...
    { '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', desc = "Order Buffer by Buffer Number" },
    { '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>',    desc = "Order Buffer by Directory" },
    { '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>',     desc = "Order Buffer by Language" },
    { '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', desc = "Order Buffer by Window Number" },
  }
}
