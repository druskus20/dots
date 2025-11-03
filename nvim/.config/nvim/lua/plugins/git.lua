return {
  {
    "akinsho/git-conflict.nvim",
    tag = "v2.1.0", -- master is broken (GitConflict... commands do not work)
    opts = {
      highlights = {
        incoming = 'DiffAdd',
        current = 'DiffText',
        ancestor = 'NeoGitDiffAdd',
      }
    },

  },
}
