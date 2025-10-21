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

-- Load core configuration
require("set")
require("remap")

-- Initialize deprecated API fixer
require("deprecated-fix").init()

-- Initialize plugin manager
require("plugin-manager").init()

-- Setup lazy.nvim with plugins
require("lazy").setup("plugins")
