return {
  'olimorris/persisted.nvim',
  event = 'VimEnter',
  opts = {
    -- autoload = true,
    use_git_branch = true,
    default_branch = 'master',
    ignored_dirs = {
      { '~/', exact = true },
    },
    should_autosave = function()
      if vim.bo.filetype == 'alpha' then
        return false
      end
      if vim.bo.filetype == '' then
        return false
      end
      if vim.api.nvim_buf_get_name(0):match 'COMMIT_EDITMSG' then
        return false
      end

      return true
    end,
  },
  priority = 500,
}
