return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      --new
      vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
      vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
      vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FC6736", bold = true })
    end,
  },
}
