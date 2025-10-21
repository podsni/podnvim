-- NOTE: Git Blame
return {
  "f-person/git-blame.nvim",
  init = function()
    vim.g.gitblame_enabled = 0
  end,
  cmd = {
    "GitBlameToggle",
    "GitBlameEnable",
    "GitBlameOpenCommitURL",
    "GitBlameCopyCommitURL",
    "GitBlameOpenFileURL",
    "GitBlameCopyFileURL",
    "GitBlameCopySHA",
  },
  opts = {},
}
