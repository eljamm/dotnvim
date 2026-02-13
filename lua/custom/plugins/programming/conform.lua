local prettyFormat = { 'treefmt', 'prettierd', 'prettier', stop_after_first = true }

-- Use formatter or treefmt if avaialble, else use fallbacks.
local function use_if_available(formatter, formatters, fallback)
  return function(bufnr)
    local cfm = require 'conform'

    if cfm.get_formatter_info('treefmt', bufnr).available then
      return { 'treefmt' }
    end

    if cfm.get_formatter_info(formatter, bufnr).available then
      return formatters or { formatter }
    end

    return fallback or {}
  end
end

return {
  'stevearc/conform.nvim',
  --  for users who want auto-save conform + lazyloading!
  event = 'BufWritePre',
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

      return { timeout_ms = 500, lsp_format = 'fallback' }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      css = prettyFormat,
      html = prettyFormat,
      javascript = prettyFormat,
      typescript = prettyFormat,
      json = prettyFormat,
      jsonc = prettyFormat,
      scss = prettyFormat,
      yaml = prettyFormat,
      sh = use_if_available 'shfmt',
      sql = use_if_available 'sql_formatter',
      gdscript = { 'gdscript_formatter', 'gdformat', stop_after_first = true },
      markdown = { 'markdownlint', 'cbfmt' },
      nix = { 'nixfmt' },
      rust = { 'rustfmt' },
      toml = { 'taplo' },
      typst = { 'typstyle' },
      go = { 'golines', 'gofumpt', 'goimports' },
      elm = use_if_available 'elm_format',
      python = use_if_available('ruff', { 'ruff_format', 'ruff_organize_imports' }, { 'isort', 'black' }),

      -- Format embedded code blocks
      -- ['*'] = { 'injected' },

      -- -- Fix common misspellings in source code on all filetypes
      -- ['*'] = { 'codespell' },

      -- Filetypes that don't have other formatters configured
      ['_'] = { 'trim_whitespace' },

      --
      -- ['*'] = { 'treefmt' },
    },
    formatters = {
      shfmt = { prepend_args = { '-i', '4' } },
      cbfmt = { prepend_args = { '--config', os.getenv 'HOME' .. '/.config/cbfmt/cbfmt.toml' } },
      statix = { command = 'statix', args = { 'fix', '--stdin' }, stdin = true },
      markdownlint = {
        command = 'markdownlint',
        stdin = false,
        args = function(ctx)
          local args = { '$FILENAME', '--fix' }

          -- get config file
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
            vim.list_extend(args, { '--config', config_path })
          end

          return args
        end,
      },
      gdscript_formatter = {
        command = 'gdscript-formatter',
        stdin = false,
        args = { '$FILENAME', '--reorder-code' },
      },
      injected = {
        options = {
          ignore_errors = true,
          lang_to_ext = {
            bash = 'sh',
            javascript = 'js',
            latex = 'tex',
            markdown = 'md',
            nix = 'nix',
            python = 'py',
            ruby = 'rb',
            rust = 'rs',
            sql = 'sql',
            typescript = 'ts',
          },
        },
      },
    },
  },
  init = function()
    local usercmd = vim.api.nvim_create_user_command

    --- Enable/Disable formatting on save
    usercmd('FormatEnable', function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, { desc = 'Re-enable autoformat-on-save' })
    --
    usercmd('FormatDisable', function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, { desc = 'Disable autoformat-on-save', bang = true })
  end,
  keys = {
    {
      '<leader>fm',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      desc = '[F]ormat buffer',
    },
    {
      '<leader>ff',
      function()
        if vim.g.disable_autoformat then
          vim.print 'Enabled Formatting'
          vim.cmd 'FormatEnable'
        else
          vim.print 'Disabled Formatting'
          vim.cmd 'FormatDisable'
        end
      end,
      desc = 'Toggle [F]ormatting',
    },
  },
}
