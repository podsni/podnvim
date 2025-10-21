local plugin_config = require("plugin-config")

local function has_api_key()
  local env_key = vim.fn.getenv("WAKATIME_API_KEY")
  if env_key ~= nil and env_key ~= "" then
    return true
  end

  local cfg_path = vim.fn.expand("~/.wakatime.cfg")
  local file = io.open(cfg_path, "r")
  if not file then
    return false
  end

  local has_cfg_key = false
  for line in file:lines() do
    local key = line:match("^%s*api_key%s*=%s*(%S+)")
    if key and key ~= "" then
      has_cfg_key = true
      break
    end
  end
  file:close()
  return has_cfg_key
end

-- Only load if API key is available
if not has_api_key() then
  vim.g.loaded_wakatime = 1
  return {}
end

return plugin_config.plugin("wakatime", {
  "wakatime/vim-wakatime",
  lazy = false,
  config = function()
    vim.notify("WakaTime plugin loaded", vim.log.levels.INFO)
  end,
})
