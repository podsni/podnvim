return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        censure_installed = {
          "lua",
          "javascript",
          "typescript",
          "rust",
          "json",
          "toml",
        },
      })
    end,
  },
}
