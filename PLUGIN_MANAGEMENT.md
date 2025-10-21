# Neovim Configuration - Plugin Management & Testing

## 🎯 Overview

This Neovim configuration now includes advanced plugin management capabilities and comprehensive testing tools to help you maintain a healthy and efficient development environment.

## 🚀 New Features

### 1. Plugin Manager (`plugin-manager.lua`)

A dynamic plugin management system that allows you to:
- Enable/disable plugins without editing configuration files
- Persist plugin states across sessions
- View plugin status in a beautiful floating window
- Interactive plugin management interface

**Key Functions:**
- `enable_plugin(name)` - Enable a specific plugin
- `disable_plugin(name)` - Disable a specific plugin  
- `toggle_plugin(name)` - Toggle plugin state
- `show_status()` - Display plugin status window
- `interactive_manager()` - Interactive plugin selection

### 2. Plugin Configuration Wrapper (`plugin-config.lua`)

Simplifies plugin configuration by integrating with the plugin manager:
- Automatic plugin registration
- Conditional loading based on plugin state
- Consistent configuration patterns

### 3. Health Checker (`health-checker.lua`)

Comprehensive testing and validation system:
- Lua syntax validation
- Plugin configuration testing
- Keymap conflict detection
- LSP configuration validation
- Colorscheme verification

## ⌨️ Key Bindings

| Key Combination | Function | Description |
|----------------|----------|-------------|
| `<leader>pm` | Plugin Manager | Open interactive plugin manager |
| `<leader>ps` | Plugin Status | Show plugin status window |
| `<leader>hc` | Health Check | Run comprehensive health check |
| `<leader>hq` | Quick Health | Run quick health check |
| `<leader>u` | Undotree | Toggle undotree (if enabled) |

## 🔧 Usage Examples

### Managing Plugins

```lua
-- In your plugin configuration file
local plugin_config = require("plugin-config")

return plugin_config.plugin("my-plugin", {
  "author/my-plugin",
  config = function()
    -- Plugin configuration
  end
})
```

### Manual Plugin Control

```lua
local plugin_manager = require("plugin-manager")

-- Enable a plugin
plugin_manager.enable_plugin("wakatime")

-- Disable a plugin  
plugin_manager.disable_plugin("undotree")

-- Check if plugin is enabled
if plugin_manager.is_enabled("telescope") then
  -- Plugin is enabled
end
```

### Running Health Checks

```lua
local health_checker = require("health-checker")

-- Run all tests and show results
health_checker.show_results()

-- Quick health check
health_checker.quick_check()
```

## 📁 File Structure

```
~/.config/nvim/
├── init.lua                 # Main configuration entry point
├── lua/
│   ├── set.lua             # Core Neovim settings
│   ├── remap.lua           # Key mappings
│   ├── plugin-manager.lua  # Plugin management system
│   ├── plugin-config.lua   # Plugin configuration wrapper
│   ├── health-checker.lua  # Testing and validation
│   └── plugins/            # Plugin configurations
│       ├── wakatime.lua    # Example: WakaTime plugin
│       ├── undotree.lua    # Example: Undotree plugin
│       └── ...             # Other plugin configs
└── test-config.sh          # Configuration test script
```

## 🧪 Testing Your Configuration

### Automated Testing

Run the test script to validate your configuration:

```bash
cd ~/.config/nvim
bash test-config.sh
```

### Manual Testing

1. **Load Configuration:**
   ```bash
   nvim --headless -c "lua vim.cmd('source init.lua')" -c "qa"
   ```

2. **Sync Plugins:**
   ```bash
   nvim --headless -c "Lazy sync" -c "qa"
   ```

3. **Health Check:**
   ```bash
   nvim --headless -c "checkhealth" -c "qa"
   ```

## 🔍 Troubleshooting

### Common Issues

1. **Plugin not loading:**
   - Check if plugin is enabled: `<leader>ps`
   - Enable plugin: `<leader>pm`

2. **Configuration errors:**
   - Run health check: `<leader>hc`
   - Check syntax: `bash test-config.sh`

3. **Keymap conflicts:**
   - Health checker will detect conflicts
   - Check `:map` command for duplicates

### Plugin State Storage

Plugin states are stored in:
```
~/.local/share/nvim/plugin_states.json
```

You can manually edit this file or delete it to reset all plugin states to default (enabled).

## 🎨 Customization

### Adding New Plugins

1. Create a new file in `lua/plugins/`
2. Use the plugin configuration wrapper:

```lua
local plugin_config = require("plugin-config")

return plugin_config.plugin("plugin-name", {
  "author/plugin-name",
  config = function()
    -- Your configuration
  end
})
```

### Custom Health Checks

Add custom tests to `health-checker.lua`:

```lua
function M.test_custom_feature()
  -- Your custom test logic
  add_result("Custom Test", success, message)
end
```

## 📝 Notes

- Plugin states persist across Neovim sessions
- Health checks run automatically when requested
- All new features are backward compatible
- Configuration follows Neovim best practices

## 🆘 Support

If you encounter issues:
1. Run `<leader>hc` for health check
2. Check plugin status with `<leader>ps`
3. Review error messages in `:messages`
4. Use `:checkhealth` for detailed diagnostics

---

**Happy coding! 🚀**

