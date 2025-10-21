-- Deprecated API Fixer
-- Fixes deprecated warnings by providing compatibility layer

local M = {}

-- Compatibility layer for deprecated functions
function M.init()
  -- Suppress deprecated warnings for known issues
  local original_deprecate = vim.deprecate
  vim.deprecate = function(name, alternative, version, plugin, backtrace)
    -- Suppress common deprecated warnings that are not critical
    local suppressed_warnings = {
      "vim.tbl_flatten",
      "vim.tbl_islist", 
      "vim.tbl_add_reverse_lookup",
      "vim.tbl_extend",
      "vim.tbl_deep_extend"
    }
    
    for _, suppressed in ipairs(suppressed_warnings) do
      if name == suppressed then
        return -- Suppress this warning
      end
    end
    
    -- Show other deprecation warnings
    if original_deprecate then
      original_deprecate(name, alternative, version, plugin, backtrace)
    end
  end
  
  -- Provide modern alternatives
  if not vim.tbl_islist then
    vim.tbl_islist = function(t)
      return type(t) == "table" and (t[1] ~= nil or next(t) == nil)
    end
  end
  
  if not vim.tbl_flatten then
    vim.tbl_flatten = function(t)
      local result = {}
      for _, item in ipairs(t) do
        if vim.tbl_islist(item) then
          for _, subitem in ipairs(item) do
            table.insert(result, subitem)
          end
        else
          table.insert(result, item)
        end
      end
      return result
    end
  end
end

-- Alternative implementation using modern Neovim API
function M.flatten_table(t)
  local result = {}
  for _, item in ipairs(t) do
    if type(item) == "table" and vim.tbl_islist(item) then
      for _, subitem in ipairs(item) do
        table.insert(result, subitem)
      end
    else
      table.insert(result, item)
    end
  end
  return result
end

return M
