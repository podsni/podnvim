-- Plugin Manager for Neovim
-- Provides functionality to enable/disable plugins dynamically

local M = {}

-- Plugin state storage
local plugin_states = {}
local plugin_configs = {}

-- Load plugin states from file
local function load_plugin_states()
  local state_file = vim.fn.stdpath("data") .. "/plugin_states.json"
  local file = io.open(state_file, "r")
  if file then
    local content = file:read("*all")
    file:close()
    local success, states = pcall(vim.json.decode, content)
    if success and states then
      plugin_states = states
    end
  end
end

-- Save plugin states to file
local function save_plugin_states()
  local state_file = vim.fn.stdpath("data") .. "/plugin_states.json"
  local file = io.open(state_file, "w")
  if file then
    file:write(vim.json.encode(plugin_states))
    file:close()
  end
end

-- Initialize plugin manager
function M.init()
  load_plugin_states()
end

-- Register a plugin configuration
function M.register_plugin(name, config)
  plugin_configs[name] = config
  if plugin_states[name] == nil then
    plugin_states[name] = true -- Default to enabled
  end
end

-- Enable a plugin
function M.enable_plugin(name)
  plugin_states[name] = true
  save_plugin_states()
  vim.notify("Plugin '" .. name .. "' enabled", vim.log.levels.INFO)
end

-- Disable a plugin
function M.disable_plugin(name)
  plugin_states[name] = false
  save_plugin_states()
  vim.notify("Plugin '" .. name .. "' disabled", vim.log.levels.INFO)
end

-- Toggle a plugin
function M.toggle_plugin(name)
  if plugin_states[name] then
    M.disable_plugin(name)
  else
    M.enable_plugin(name)
  end
end

-- Check if plugin is enabled
function M.is_enabled(name)
  return plugin_states[name] ~= false
end

-- Get plugin configuration with state check
function M.get_plugin_config(name)
  if not M.is_enabled(name) then
    return nil
  end
  return plugin_configs[name]
end

-- List all plugins and their states
function M.list_plugins()
  local plugins = {}
  for name, enabled in pairs(plugin_states) do
    table.insert(plugins, {
      name = name,
      enabled = enabled,
      config = plugin_configs[name]
    })
  end
  return plugins
end

-- Show plugin status in a floating window
function M.show_status()
  local plugins = M.list_plugins()
  local lines = { "Plugin Status:", "" }
  
  for _, plugin in ipairs(plugins) do
    local status = plugin.enabled and "✓" or "✗"
    local line = string.format("%s %s: %s", status, plugin.name, plugin.enabled and "enabled" or "disabled")
    table.insert(lines, line)
  end
  
  -- Create floating window
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  
  local opts = {
    relative = "editor",
    width = 50,
    height = #lines + 2,
    row = 1,
    col = 1,
    anchor = "NW",
    style = "minimal",
    border = "rounded",
    title = "Plugin Manager",
    title_pos = "center"
  }
  
  local win = vim.api.nvim_open_win(buf, true, opts)
  
  -- Auto-close after 5 seconds
  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, 5000)
end

-- Interactive plugin manager
function M.interactive_manager()
  local plugins = M.list_plugins()
  local items = {}
  
  for _, plugin in ipairs(plugins) do
    local status = plugin.enabled and "✓" or "✗"
    table.insert(items, {
      text = string.format("%s %s", status, plugin.name),
      value = plugin.name,
      enabled = plugin.enabled
    })
  end
  
  vim.ui.select(items, {
    prompt = "Select plugin to toggle:",
    format_item = function(item)
      return item.text
    end
  }, function(selected)
    if selected then
      M.toggle_plugin(selected.value)
    end
  end)
end

return M
