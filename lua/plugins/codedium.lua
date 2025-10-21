local plugin_config = require("plugin-config")

return plugin_config.plugin("codedium", {
    "Exafunction/codeium.vim",
    lazy = false, -- Load immediately
    config = function()
        -- Codeium configuration
        vim.g.codeium_disable_bindings = 1 -- Disable default keymaps
        
        -- Custom keymaps for Codeium
        vim.keymap.set('i', '<C-g>', function()
            return vim.fn['codeium#Accept']()
        end, { expr = true, silent = true, desc = "Accept Codeium suggestion" })
        
        vim.keymap.set('i', '<C-;>', function()
            return vim.fn['codeium#CycleCompletions'](1)
        end, { expr = true, silent = true, desc = "Next Codeium suggestion" })
        
        vim.keymap.set('i', '<C-,>', function()
            return vim.fn['codeium#CycleCompletions'](-1)
        end, { expr = true, silent = true, desc = "Previous Codeium suggestion" })
        
        vim.keymap.set('i', '<C-x>', function()
            return vim.fn['codeium#Clear']()
        end, { expr = true, silent = true, desc = "Clear Codeium suggestion" })
        
        -- Status line integration
        vim.api.nvim_create_autocmd("User", {
            pattern = "CodeiumStatusChanged",
            callback = function()
                vim.cmd("redrawstatus")
            end,
        })
        
        -- Enable Codeium
        vim.cmd("CodeiumEnable")
        
        print("Codeium plugin loaded and configured")
    end,
})
