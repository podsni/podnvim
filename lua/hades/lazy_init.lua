local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "hades.lazy" },
        { import = "hades.lazy.autoparis" },
        { import = "hades.lazy.bqf" },
        { import = "hades.lazy.breadcrubms" },
        { import = "hades.lazy.cloak" },
        { import = "hades.lazy.codedium" },
        { import = "hades.lazy.cmp" },
        { import = "hades.lazy.colorizer" },
        { import = "hades.lazy.colorscheme" },
        { import = "hades.lazy.comment" },
        { import = "hades.lazy.devicons" },
        { import = "hades.lazy.fugitive" },
        { import = "hades.lazy.gitsign" },
        { import = "hades.lazy.harpoon" },
        { import = "hades.lazy.iluminate" },
        { import = "hades.lazy.indentline" },
        { import = "hades.lazy.lab" },
        { import = "hades.lazy.lsp" },
        { import = "hades.lazy.lspzero" },
        { import = "hades.lazy.lualine" },
        { import = "hades.lazy.mason" },
        { import = "hades.lazy.navic" },
        { import = "hades.lazy.neogen" },
        { import = "hades.lazy.neogit" },
        { import = "hades.lazy.neotest" },
        { import = "hades.lazy.none-ls" },
        { import = "hades.lazy.nvimtree" },
        { import = "hades.lazy.oil" },
        { import = "hades.lazy.schemastore" },
        { import = "hades.lazy.snippets" },
        { import = "hades.lazy.telescope" },
        { import = "hades.lazy.toogleterm" },
        { import = "hades.lazy.treesitter" },
        { import = "hades.lazy.trouble" },
        { import = "hades.lazy.ufo" },
        { import = "hades.lazy.undotree" },
        { import = "hades.lazy.wakatime" },
        { import = "hades.lazy.whichkey" },
        { import = "hades.lazy.zenmode" },
    },
    change_detection = { notify = false },
    rocks = {
        hererocks = false,
        enabled = false,
    },
})
--[[
require("lazy").setup({
  use("~/personal/harpoon")

  use("theprimeagen/vim-be-good")
  use("theprimeagen/refactoring.nvim")
  --use("nvim-treesitter/nvim-treesitter-context");

  use {
	  "VonHeikemen/lsp-zero.nvim",
	  branch = "v1.x",
	  requires = {
		  -- LSP Support
		  {"neovim/nvim-lspconfig"},
		  {"williamboman/mason.nvim"},
		  {"williamboman/mason-lspconfig.nvim"},

		  -- Autocompletion
		  {"hrsh7th/nvim-cmp"},
		  {"hrsh7th/cmp-buffer"},
		  {"hrsh7th/cmp-path"},
		  {"saadparwaiz1/cmp_luasnip"},
		  {"hrsh7th/cmp-nvim-lsp"},
		  {"hrsh7th/cmp-nvim-lua"},

		  -- Snippets
		  {"L3MON4D3/LuaSnip"},
		  {"rafamadriz/friendly-snippets"},
	  }
  }

}, {})

--]]
