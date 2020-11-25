--require("mobdebug").start()

kong = {
    test_map = {},
    response = {
        set_header = function (name, value)
            kong.test_map[name] = value
        end,
        get_header = function(name)
            return kong.test_map[name]
        end,
    }
} 

ngx = {
    log = function (log_level, ...)
        print(...)
    end
}

local lu = require('lib.luaunit')
local transformer = require('src.transformer')

TestTransformer = {} --class
function TestTransformer:testTransformOtherHeader()
    local conf = {
        headers = {
            "Set-Cookie:tag; ${x-other-header} secure;",
        },
    }
    local headers = {}
    headers["x-other-header"] = "eyJhbGciOiJIUzI1NiIsImtpZCIgOiAiODQ4MzcyZDktN2Q5ZC00NDk2LWI3ODUtYWU4NWYzNzZjNjk1In0; httpOnly;"
    headers["Set-Cookie"] = "OriginalValue; httpOnly;"
    transformer.transform_headers(conf, headers)
    lu.assertEquals(kong.response.get_header("Set-Cookie"), "tag; eyJhbGciOiJIUzI1NiIsImtpZCIgOiAiODQ4MzcyZDktN2Q5ZC00NDk2LWI3ODUtYWU4NWYzNzZjNjk1In0; httpOnly; secure;")
end

function TestTransformer:testTransformSameHeader()
    local conf = {
        headers = {
            "Set-Cookie:${Set-Cookie} secure;",
        },
    }
    local headers = {}
    headers["Set-Cookie"] = "OriginalValue; httpOnly;"
    transformer.transform_headers(conf, headers)
    lu.assertEquals(kong.response.get_header("Set-Cookie"), "OriginalValue; httpOnly; secure;")
end

-- class TestDecrypter

os.exit(lu.LuaUnit:run())
