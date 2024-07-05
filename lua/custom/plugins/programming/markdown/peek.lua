return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    keys = {
      {
        '<leader>mpt',
        '<CMD>MarkdownPreviewToggle<CR>',
        mode = 'n',
        desc = '[M]arkdown [P]review [T]oggle',
      },
      {
        '<leader>mpb',
        '<CMD>MarkdownPreview<CR>',
        mode = 'n',
        desc = '[M]arkdown [P]review [B]egin',
      },
      {
        '<leader>mps',
        '<CMD>MarkdownPreview<CR>',
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
