return {
  'saecki/crates.nvim',
  event = { 'BufRead Cargo.toml' },
  opts = {
    lsp = {
      enabled = true,
      actions = true,
      completion = true,
      hover = true,
    },
    completion = {
      crates = {
        enabled = true, -- disabled by default
        max_results = 8, -- maximum number of search results to display
        min_chars = 3, -- minimum number of charaters to type before completions begin appearing
      },
    },
  },
}
