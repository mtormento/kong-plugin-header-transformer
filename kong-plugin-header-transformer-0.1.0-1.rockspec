package = "kong-plugin-header-transformer"

version = "0.1.0-1"

-- The version '0.1.0' is the source code version, the trailing '1' is the version of this rockspec.
-- whenever the source version changes, the rockspec should be reset to 1. The rockspec version is only
-- updated (incremented) when this file changes, but the source remains the same.

local pluginName = package:match("^kong%-plugin%-(.+)$")  -- "header-transformer"
supported_platforms = {"linux", "macosx"}

source = {
  url = "https://github.com/mtormento/kong-plugin-header-transformer.git",
  tag = "0.1.0"
}

description = {
  summary = "A Kong plugin that transforms request and response headers",
  license = "MIT"
}

dependencies = {
  "lua >= 5",
}

build = {
  type = "builtin",
  modules = {
    ["kong.plugins.header-transformer.transformer"] = "src/transformer.lua",
    ["kong.plugins.header-transformer.handler"] = "src/handler.lua",
    ["kong.plugins.header-transformer.schema"] = "src/schema.lua"
  }
}
