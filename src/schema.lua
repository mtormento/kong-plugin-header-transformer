local typedefs = require "kong.db.schema.typedefs"
local validate_header_name = require("kong.tools.utils").validate_header_name


local function validate_headers(pair, validate_value)
  local name, value = pair:match("^([^:]+):*(.-)$")
  if validate_header_name(name) == nil then
    return nil, string.format("'%s' is not a valid header", tostring(name))
  end

  if validate_value then
    if validate_header_name(value) == nil then
      return nil, string.format("'%s' is not a valid header", tostring(value))
    end
  end
  return true
end


local function validate_colon_headers(pair)
  return validate_headers(pair, true)
end

local colon_headers_array = {
  type = "array",
  default = {},
  elements = { type = "string", match = "^[^:]+:.*$", custom_validator = validate_colon_headers },
}

return {
  name = "response-transformer",
  fields = {
    { run_on = typedefs.run_on_first },
    { protocols = typedefs.protocols_http },
    { config = {
        type = "record",
        fields = {
          { headers = colon_headers_array },
        },
      },
    },
  },
}