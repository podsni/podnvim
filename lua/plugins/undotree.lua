local plugin_config = require("plugin-config")

return plugin_config.plugin("undotree", {
    "jiaoshijie/undotree",
    lazy = false, -- Load immediately
    config = function()
        local undotree = require('undotree')

        -- Setup undotree dengan konfigurasi optimal
        undotree.setup({
            float_diff = true,  -- menggunakan float window untuk preview diff
            layout = "left_bottom", -- layout: "left_bottom", "left_left_bottom"
            position = "left", -- posisi: "right", "bottom"
            ignore_filetype = {
                'undotree',
                'undotreeDiff',
                'qf',
            },
            window = {
                winblend = 30,
                border = "rounded", -- border style
            },
            keymaps = {
                j = "move_next",
                k = "move_prev",
                gj = "move2parent",
                J = "move_change_next",
                K = "move_change_prev",
                ['<cr>'] = "action_enter",
                p = "enter_diffbuf",
                q = "quit",
            },
        })

        -- Keymaps untuk undotree
        vim.keymap.set('n', '<leader>u', require('undotree').toggle, { 
            noremap = true, 
            silent = true, 
            desc = "Toggle Undotree" 
        })
        
        vim.keymap.set('n', '<leader>uo', require('undotree').open, { 
            noremap = true, 
            silent = true, 
            desc = "Open Undotree" 
        })
        
        vim.keymap.set('n', '<leader>uc', require('undotree').close, { 
            noremap = true, 
            silent = true, 
            desc = "Close Undotree" 
        })

        -- User command untuk undotree
        vim.api.nvim_create_user_command('Undotree', function(opts)
            local args = opts.fargs
            local cmd = args[1]

            if cmd == "toggle" then
                require("undotree").toggle()
            elseif cmd == "open" then
                require("undotree").open()
            elseif cmd == "close" then
                require("undotree").close()
            else
                vim.notify("Invalid subcommand: " .. (cmd or ""), vim.log.levels.ERROR)
            end
        end, {
            nargs = 1,
            complete = function(_, line)
                local subcommands = { "toggle", "open", "close" }
                local input = vim.split(line, "%s+")
                local prefix = input[#input]

                return vim.tbl_filter(function(cmd)
                    return vim.startswith(cmd, prefix)
                end, subcommands)
            end,
            desc = "Undotree command with subcommands: toggle, open, close",
        })
    end
})

