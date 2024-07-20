-- TODO: move into lsp folder
return {
  {
    'mfussenegger/nvim-lint',
    event = 'LazyFile',
    config = function()
      local lint = require 'lint'
      local linters = require('lint').linters

      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        nix = { 'statix' },
        fish = { 'fish' },
        sh = { 'shellcheck' },
      }

      -- ------------
      -- markdownlint
      -- ------------
      local ctx = { filename = vim.api.nvim_buf_get_name(0) }

      local config_path = vim.fs.find('config.yaml', { path = vim.env.HOME .. '/.config/markdownlint' })[1]
      local local_config = vim.fs.find({
        '.markdownlint.json',
        '.markdownlint.jsonc',
        '.markdownlint.yaml',
        '.markdownlint.yml',
      }, { path = ctx.filename, upward = true })[1]

      if local_config then
        config_path = local_config
      end

      -- use config if it exists
      if config_path then
        linters.markdownlint.args = { '--config', config_path }
      end
      -- ------------

      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      -- lint.linters_by_ft = lint.linters_by_ft or {}
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      --
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
