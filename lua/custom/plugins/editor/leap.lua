return {
  url = 'https://codeberg.org/andyg/leap.nvim',
  dependencies = { 'tpope/vim-repeat' },
  config = function()
    vim.keymap.set('n', 's', '<Plug>(leap)')
    vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
    vim.keymap.set({ 'x', 'o' }, 's', '<Plug>(leap-forward)')
    vim.keymap.set({ 'x', 'o' }, 'S', '<Plug>(leap-backward)')

    -- Define equivalence classes for brackets and quotes, in addition to
    -- the default whitespace group.
    require('leap').opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }

    -- Override some old defaults - use backspace instead of tab (see issue #165).
    require('leap').opts.special_keys.prev_target = '<backspace>'
    require('leap').opts.special_keys.prev_group = '<backspace>'

    -- Use the traversal keys to repeat the previous motion without explicitly
    -- invoking Leap.
    require('leap.user').set_repeat_keys('<enter>', '<backspace>')

    require('leap').opts.vim_opts['go.ignorecase'] = true

    -- f/t motions
    do
      local function ft(key_specific_args)
        require('leap').leap(vim.tbl_deep_extend('keep', key_specific_args, {
          inputlen = 1,
          inclusive = true,
          opts = {
            -- Force autojump.
            labels = '',
            -- Match the modes where you don't need labels (`:h mode()`).
            safe_labels = vim.fn.mode(1):match 'o' and '' or nil,
          },
        }))
      end

      -- A helper function making it easier to set "clever-f" behavior
      -- (using f/F or t/T instead of ;/, - see the plugin clever-f.vim).
      local clever = require('leap.user').with_traversal_keys
      local clever_f, clever_t = clever('f', 'F'), clever('t', 'T')

      vim.keymap.set({ 'n', 'x', 'o' }, 'f', function()
        ft { opts = clever_f }
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, 'F', function()
        ft { backward = true, opts = clever_f }
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, 't', function()
        ft { offset = -1, opts = clever_t }
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, 'T', function()
        ft { backward = true, offset = 1, opts = clever_t }
      end)
    end
  end,
}
