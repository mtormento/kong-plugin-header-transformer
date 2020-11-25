local type = type
local match = string.match
local noop = function() end

local kong = kong

local _M = {}

function iter(config_array)
  if type(config_array) ~= "table" then
    return noop
  end

  return function(config_array, i)
    i = i + 1

    local header_to_test = config_array[i]
    if header_to_test == nil then -- n + 1
      return nil
    end

    local header_to_test_name, header_to_test_value = match(header_to_test, "^([^:]+):*(.-)$")
    if header_to_test_value == "" then
      header_to_test_value = nil
    end

    return i, header_to_test_name, header_to_test_value
  end, config_array, 0
end


---
--   # Example:
--   ngx.headers = header_filter.transform_headers(conf, ngx.headers)
-- @param[type=table] conf Plugin configuration.
-- @param[type=table] ngx_headers Table of headers, that should be `ngx.headers`
-- @return table A table containing the new headers.
function _M.transform_headers(conf, headers)
  -- transform headers
  for _, header_name, transformation in iter(conf.headers) do
    if headers[header_name] ~= nil and transformation then
      local source_header = headers[transformation:match("${(.*)}")]
      if source_header ~= nil then
        local new_header_value = transformation:gsub("${.*}", source_header)
        kong.response.set_header(header_name, new_header_value)
        ngx.log(ngx.DEBUG, "header-transformer", "header transformation applied to ", header_name, ": ", new_header_value)
      else
        ngx.log(ngx.WARN, "header-transformer", "header transformation for ", header_name, " is not valid: ", transformation)
      end
    end
  end
end

return _M