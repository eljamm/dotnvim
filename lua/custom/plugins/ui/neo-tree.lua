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
          ['S'] = 'open_split',
          ['V'] = 'open_vsplit',
          ['<M-l>'] = 'system_open',
          -- preview
          ['p'] = { 'toggle_preview', config = { use_float = false, use_image_nvim = true } },
          -- ['P'] = 'focus_preview',
          ['<M-p>'] = { 'scroll_preview', config = { direction = 10 } },
          ['<M-n>'] = { 'scroll_preview', config = { direction = -10 } },
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
      },
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.jobstart({ 'xdg-open', path }, { detach = true })
        end,
      },
      event_handlers = {
        -- Use normal mode for renaming files
        {
          event = 'neo_tree_popup_input_ready',
          ---@param args { bufnr: integer, winid: integer }
          handler = function(args)
            -- -- enter input popup with normal mode by default.
            -- vim.cmd 'stopinsert'

            -- map <esc> to enter normal mode (by default closes prompt)
            -- don't forget `opts.buffer` to specify the buffer of the popup.
            vim.keymap.set('i', '<esc>', vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
          end,
        },
      },
    },
    init = function()
      vim.keymap.set(
        { 'n', 'x', 't' },
        '<C-n>',
        '<CMD>Neotree toggle position=left<CR>',
        { desc = 'Toggle [N]eoTree', nowait = true }
      )
      -- vim.keymap.set(
      --   { 'n', 'x', 't' },
      --   '<C-f>',
      --   '<CMD>Neotree float reveal toggle<CR>',
      --   { desc = 'Toggle [F]ull NeoTree' }
      -- )
    end,
  },
}
