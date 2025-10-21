local plugin_config = require("plugin-config")

return plugin_config.plugin("harpoon", {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED: Setup harpoon
    harpoon.setup({
      global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,
        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,
        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,
        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,
        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },
        -- set marks specific to each git branch inside git repository
        mark_branch = false,
        -- enable tabline with harpoon marks
        tabline = false,
        tabline_prefix = "   ",
        tabline_suffix = "   ",
      }
    })

    -- Keymaps for harpoon
    vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Harpoon: Add file" })
    vim.keymap.set("n", "<leader>ma", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Toggle menu" })

    -- Quick navigation to harpoon marks
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon: Go to mark 1" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon: Go to mark 2" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon: Go to mark 3" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon: Go to mark 4" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon: Previous" })
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon: Next" })

    -- Additional useful keymaps
    vim.keymap.set("n", "<leader>hr", function() harpoon:list():clear() end, { desc = "Harpoon: Clear all marks" })
    vim.keymap.set("n", "<leader>hs", function() harpoon:list():remove() end, { desc = "Harpoon: Remove current file" })
  end,
})
