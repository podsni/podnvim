local M = {
  "linrongbin16/gitlinker.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  event = "VeryLazy",
}

function M.config()
  require("gitlinker").setup {
    message = false,
    console_log = false,
  }
end

return M
