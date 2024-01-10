return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "c",
      "cpp",
      "lua",
      "python",
      "rust",
      "vim",
      "vimdoc",
    },

    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- (set to false if you don't have `tree-sitter` CLI installed locally)
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    --ignore_install = {  },

    highlight = {
      enable = true,

      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        local disabled_langs = {
          "diff",
        }

        -- Large files
        if ok and stats and stats.size > max_filesize then
          return true
        end
        -- Disabled languages
        for _, item in pairs(disabled_langs) do
          if lang == item then
            return true
          end
        end
      end,

      additional_vim_regex_highlighting = false,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
