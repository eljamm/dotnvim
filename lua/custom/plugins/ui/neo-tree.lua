return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    cmd = { 'Neotree' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
      'MunifTanjim/nui.nvim',
    },
    opts = {
      close_if_last_window = true,
      window = {
        mappings = {
          ['l'] = 'open',
          ['h'] = 'open_split',
          -- TODO: `v` is for select. Find another key for vsplit
          -- ['v'] = 'open_vsplit',
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
      },
      event_handlers = {
        -- Use normal mode for renaming files
        {
          event = 'neo_tree_popup_input_ready',
          ---@param args { bufnr: integer, winid: integer }
          handler = function(args)
            -- enter input popup with normal mode by default.
            vim.cmd 'stopinsert'
            -- map <esc> to enter normal mode (by default closes prompt)
            -- don't forget `opts.buffer` to specify the buffer of the popup.
            vim.keymap.set('i', '<esc>', vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
          end,
        },
      },
    },
    keys = {
      { '<C-n>', '<CMD>Neotree toggle<CR>', mode = { 'n', 'x', 't' }, desc = 'Toggle [N]eoTree', nowait = true },
      {
        '<C-f>',
        '<CMD>Neotree toggle position=current<CR>',
        mode = { 'n', 'x' },
        desc = 'Toggle [F]ull NeoTree',
        nowait = true,
      },
    },
  },
}
