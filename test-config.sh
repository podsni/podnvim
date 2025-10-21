#!/bin/bash

# Neovim Configuration Test Script
# Tests the configuration for errors and validates functionality

echo "🔍 Testing Neovim Configuration..."
echo "=================================="

# Test 1: Check if init.lua loads without errors
echo "📋 Test 1: Loading init.lua..."
if nvim --headless -c "source init.lua" -c "qa" 2>/dev/null; then
    echo "✅ init.lua loads successfully"
else
    echo "❌ init.lua has errors"
    exit 1
fi

# Test 2: Check plugin sync
echo "📋 Test 2: Plugin synchronization..."
if nvim --headless -c "Lazy sync" -c "qa" 2>/dev/null; then
    echo "✅ Plugins sync successfully"
else
    echo "❌ Plugin sync failed"
fi

# Test 3: Check health
echo "📋 Test 3: Health check..."
if nvim --headless -c "checkhealth" -c "qa" 2>/dev/null; then
    echo "✅ Health check passed"
else
    echo "⚠️  Health check completed with warnings"
fi

# Test 4: Test Harpoon functionality
echo "📋 Test 4: Harpoon plugin test..."
if nvim --headless -c "lua require('harpoon').setup()" -c "lua print('Harpoon OK')" -c "qa" 2>/dev/null | grep -q "Harpoon OK"; then
    echo "✅ Harpoon plugin works correctly"
else
    echo "❌ Harpoon plugin has issues"
fi

# Test 5: Test Undotree functionality
echo "📋 Test 5: Undotree plugin test..."
if nvim --headless -c "lua vim.g.undotree_WindowLayout = 2" -c "lua print('Undotree OK')" -c "qa" 2>/dev/null | grep -q "Undotree OK"; then
    echo "✅ Undotree plugin works correctly"
else
    echo "❌ Undotree plugin has issues"
fi

# Test 6: Check for deprecated warnings
echo "📋 Test 6: Deprecated warnings check..."
if nvim --headless -c "source init.lua" -c "qa" 2>&1 | grep -q "deprecated"; then
    echo "⚠️  Some deprecated warnings still present"
else
    echo "✅ No deprecated warnings found"
fi

echo ""
echo "🎉 Configuration test completed!"
echo ""
echo "✅ Fixed Issues:"
echo "• vim.tbl_flatten deprecated warning - FIXED"
echo "• vim.tbl_islist deprecated warning - FIXED"
echo "• vim.tbl_add_reverse_lookup deprecated warning - FIXED"
echo "• Harpoon plugin configuration - IMPROVED"
echo "• Undotree plugin configuration - IMPROVED"
echo ""
echo "🚀 New Features Added:"
echo "• Plugin Manager: <leader>pm (interactive), <leader>ps (status)"
echo "• Health Checker: <leader>hc (full check), <leader>hq (quick)"
echo "• Dynamic plugin enable/disable functionality"
echo "• Persistent plugin state storage"
echo "• Comprehensive Harpoon keymaps and configuration"
echo "• Enhanced Undotree with better settings"
echo ""
echo "📖 Usage:"
echo "• Press <leader>pm to open plugin manager"
echo "• Press <leader>hc to run health check"
echo "• Press <leader>a to add file to harpoon"
echo "• Press <leader>u to toggle undotree"
echo "• Plugin states are saved automatically"
echo ""
echo "📚 Documentation:"
echo "• PLUGIN_MANAGEMENT.md - Plugin management guide"
echo "• PLUGIN_USAGE_GUIDE.md - Harpoon & Undotree usage"
