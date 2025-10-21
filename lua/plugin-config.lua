-- Plugin Configuration Wrapper
-- Integrates with plugin-manager.lua to provide conditional loading

local plugin_manager = require("plugin-manager")

local M = {}

-- Initialize plugin manager
plugin_manager.init()

-- Create a plugin configuration with conditional loading
function M.plugin(name, config)
  -- Register the plugin with the manager
  plugin_manager.register_plugin(name, config)
  
  -- Return the configuration directly if enabled, or empty table if disabled
  if plugin_manager.is_enabled(name) then
    return config
  else
    return {}
  end
end

-- Helper function to create lazy-loaded plugins
function M.lazy_plugin(name, config)
  return M.plugin(name, config)
end

-- Add keymaps for plugin management
function M.setup_keymaps()
  vim.keymap.set("n", "<leader>pm", plugin_manager.interactive_manager, { desc = "Plugin Manager" })
  vim.keymap.set("n", "<leader>ps", plugin_manager.show_status, { desc = "Show Plugin Status" })
end

-- Initialize keymaps
M.setup_keymaps()

return M
