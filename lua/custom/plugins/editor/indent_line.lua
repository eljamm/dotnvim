return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    event = 'LazyFile',
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      scope = {
        include = {
          node_type = {
            nix = { 'attrset_expression', 'list_expression' },
          },
        },
      },
      indent = { char = '╎' },
    },
  },
}
