vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- Move BLocks in visual Mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") --Move current line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") --Move current line up

vim.keymap.set("v", "L", ":normal! >gv<CR>")
vim.keymap.set("v", "H", ":normal! <gv<CR>")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Multi line
vim.keymap.set("n", "ml", "<C-v>") --multiLine
vim.keymap.set("v", "ml", "<S-i>") -- multiline

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

---- Toggle line wrapping
vim.api.nvim_set_keymap('n', '<leader>wr', ':lua vim.wo.wrap = not vim.wo.wrap<CR>', { noremap = true, silent = true })


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/hades<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Plugin Management Keymaps
vim.keymap.set("n", "<leader>pm", function()
  require("plugin-manager").interactive_manager()
end, { desc = "Plugin Manager" })

vim.keymap.set("n", "<leader>ps", function()
  require("plugin-manager").show_status()
end, { desc = "Show Plugin Status" })

-- Health Check Keymaps
vim.keymap.set("n", "<leader>hc", function()
  require("health-checker").show_results()
end, { desc = "Health Check" })

vim.keymap.set("n", "<leader>hq", function()
  require("health-checker").quick_check()
end, { desc = "Quick Health Check" })

-- Harpoon Keymaps (additional)
vim.keymap.set("n", "<leader>ha", function()
  require("harpoon"):list():append()
end, { desc = "Harpoon: Add file" })

vim.keymap.set("n", "<leader>hm", function()
  require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Harpoon: Toggle menu" })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Craft
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)


-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")
-- window management
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Change window to right" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Change window to left" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Change window to bottom" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Change window to top" })
keymap.set("n", "<C-x>", "<cmd>close<CR>", { desc = "Close current split" })


-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")
keymap.set('n', '<CR>', ':nohlsearch<CR><CR>', { noremap = true, silent = true })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
keymap.set("n", "L", "$<left>")
keymap.set("n", "H", "^")

-- Macos Recorded
keymap.set("n", "Q", "@qj")
keymap.set("x", "Q", ":norm @q<CR>")
keymap.set("n", "fz", ":HopWord<CR>")



