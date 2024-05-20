return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    keys = {
      {
        '<leader>mpt',
        '<cmd>MarkdownPreviewToggle<cr>',
        mode = 'n',
        desc = '[M]arkdown [P]review [T]oggle',
      },
      {
        '<leader>mpb',
        '<cmd>MarkdownPreview<cr>',
        mode = 'n',
        desc = '[M]arkdown [P]review [B]egin',
      },
      {
        '<leader>mps',
        '<cmd>MarkdownPreview<cr>',
        mode = 'n',
        desc = '[M]arkdown [P]review [S]top',
      },
    },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
}
