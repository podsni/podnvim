-- Neovim Configuration Health Checker
-- Comprehensive testing and validation script

local M = {}

-- Test results storage
local test_results = {}

-- Add test result
local function add_result(test_name, success, message)
  table.insert(test_results, {
    name = test_name,
    success = success,
    message = message or (success and "PASS" or "FAIL")
  })
end

-- Test basic Lua syntax
function M.test_lua_syntax()
  local files_to_test = {
    "init.lua",
    "lua/set.lua",
    "lua/remap.lua",
    "lua/plugin-manager.lua",
    "lua/plugin-config.lua"
  }
  
  local all_passed = true
  for _, file in ipairs(files_to_test) do
    local file_path = vim.fn.stdpath("config") .. "/" .. file
    local success, err = pcall(dofile, file_path)
    if not success then
      add_result("Lua Syntax: " .. file, false, err)
      all_passed = false
    end
  end
  
  if all_passed then
    add_result("Lua Syntax Check", true, "All core files have valid syntax")
  end
end

-- Test plugin configurations
function M.test_plugin_configs()
  local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
  local files = vim.fn.glob(plugin_dir .. "/*.lua", false, true)
  
  local valid_plugins = 0
  local total_plugins = #files
  
  for _, file in ipairs(files) do
    local success, result = pcall(dofile, file)
    if success and result and type(result) == "table" then
      valid_plugins = valid_plugins + 1
    else
      add_result("Plugin Config: " .. vim.fn.fnamemodify(file, ":t"), false, "Invalid configuration")
    end
  end
  
  add_result("Plugin Configurations", valid_plugins == total_plugins, 
    string.format("%d/%d plugins have valid configurations", valid_plugins, total_plugins))
end

-- Test keymap conflicts
function M.test_keymap_conflicts()
  local conflicts = {}
  local keymaps = vim.api.nvim_get_keymap("n")
  
  local key_counts = {}
  for _, keymap in ipairs(keymaps) do
    local lhs = keymap.lhs
    if key_counts[lhs] then
      key_counts[lhs] = key_counts[lhs] + 1
      if key_counts[lhs] == 2 then
        table.insert(conflicts, lhs)
      end
    else
      key_counts[lhs] = 1
    end
  end
  
  if #conflicts == 0 then
    add_result("Keymap Conflicts", true, "No conflicting keymaps found")
  else
    add_result("Keymap Conflicts", false, 
      string.format("Found %d conflicting keymaps: %s", #conflicts, table.concat(conflicts, ", ")))
  end
end

-- Test plugin manager functionality
function M.test_plugin_manager()
  local success, plugin_manager = pcall(require, "plugin-manager")
  if not success then
    add_result("Plugin Manager", false, "Failed to load plugin-manager module")
    return
  end
  
  -- Test basic functionality
  local test_plugin = "test-plugin"
  plugin_manager.register_plugin(test_plugin, { test = true })
  
  if plugin_manager.is_enabled(test_plugin) then
    add_result("Plugin Manager: Registration", true, "Plugin registration works")
  else
    add_result("Plugin Manager: Registration", false, "Plugin registration failed")
  end
  
  plugin_manager.disable_plugin(test_plugin)
  if not plugin_manager.is_enabled(test_plugin) then
    add_result("Plugin Manager: Disable", true, "Plugin disable works")
  else
    add_result("Plugin Manager: Disable", false, "Plugin disable failed")
  end
  
  plugin_manager.enable_plugin(test_plugin)
  if plugin_manager.is_enabled(test_plugin) then
    add_result("Plugin Manager: Enable", true, "Plugin enable works")
  else
    add_result("Plugin Manager: Enable", false, "Plugin enable failed")
  end
end

-- Test LSP configuration
function M.test_lsp_config()
  local lsp_config_file = vim.fn.stdpath("config") .. "/lua/plugins/lsp.lua"
  local file_exists = vim.fn.filereadable(lsp_config_file) == 1
  
  if file_exists then
    local success, result = pcall(dofile, lsp_config_file)
    if success then
      add_result("LSP Configuration", true, "LSP config file is valid")
    else
      add_result("LSP Configuration", false, "LSP config has errors: " .. tostring(result))
    end
  else
    add_result("LSP Configuration", false, "LSP config file not found")
  end
end

-- Test colorscheme
function M.test_colorscheme()
  local colorscheme_files = vim.fn.glob(vim.fn.stdpath("config") .. "/lua/plugins/*colorscheme*.lua", false, true)
  local colorscheme_plugins = vim.fn.glob(vim.fn.stdpath("config") .. "/lua/plugins/catppuccin.lua", false, true)
  
  if #colorscheme_files > 0 or #colorscheme_plugins > 0 then
    add_result("Colorscheme", true, "Colorscheme configuration found")
  else
    add_result("Colorscheme", false, "No colorscheme configuration found")
  end
end

-- Run all tests
function M.run_all_tests()
  test_results = {}
  
  M.test_lua_syntax()
  M.test_plugin_configs()
  M.test_keymap_conflicts()
  M.test_plugin_manager()
  M.test_lsp_config()
  M.test_colorscheme()
  
  return test_results
end

-- Display test results
function M.show_results()
  local results = M.run_all_tests()
  local passed = 0
  local failed = 0
  
  local lines = { "Neovim Configuration Health Check", "=" .. string.rep("=", 40), "" }
  
  for _, result in ipairs(results) do
    local status = result.success and "✓" or "✗"
    local color = result.success and "green" or "red"
    local line = string.format("%s %s: %s", status, result.name, result.message)
    table.insert(lines, line)
    
    if result.success then
      passed = passed + 1
    else
      failed = failed + 1
    end
  end
  
  table.insert(lines, "")
  table.insert(lines, string.format("Summary: %d passed, %d failed", passed, failed))
  
  -- Create floating window
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  
  local opts = {
    relative = "editor",
    width = 80,
    height = #lines + 2,
    row = 1,
    col = 1,
    anchor = "NW",
    style = "minimal",
    border = "rounded",
    title = "Health Check Results",
    title_pos = "center"
  }
  
  local win = vim.api.nvim_open_win(buf, true, opts)
  
  -- Auto-close after 10 seconds
  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, 10000)
end

-- Quick health check command
function M.quick_check()
  vim.cmd("checkhealth")
end

return M

