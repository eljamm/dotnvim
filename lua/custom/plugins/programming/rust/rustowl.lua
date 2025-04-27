return {
  -- Visualize Ownership and Lifetimes in Rust
  {
    'cordx56/rustowl',
    version = '*', -- Latest stable version
    lazy = false, -- This plugin is already lazy
    opts = {
      client = {
        on_attach = function(_, buffer)
          vim.keymap.set('n', '<leader>li', function()
            require('rustowl').toggle(buffer)
          end, { buffer = buffer, desc = 'Toggle RustOwl' })
        end,
      },
    },
  },
}
