local BasePlugin = require "kong.plugins.base_plugin"
local transformer = require "kong.plugins.header-transformer.transformer"

local plugin_name = "header-transformer"

local kong = kong

local HeaderTransformerHandler = BasePlugin:extend{}

HeaderTransformerHandler.PRIORITY = 810 -- refer to https://docs.konghq.com/1.5.x/plugin-development/custom-logic/#plugins-execution-order
HeaderTransformerHandler.VERSION = "0.1.0"

function HeaderTransformerHandler:new()
  HeaderTransformerHandler.super.new(self, plugin_name)
end

function HeaderTransformerHandler:header_filter(conf)
  transformer.transform_headers(conf, kong.response.get_headers())
end

return HeaderTransformerHandler
