local AsheauthHandler = {
  PRIORITY = 900,
  VERSION = "1.0"
}

local function reques_http()
  local request = require "http.request"
  local new_request= request.new_from_uri("http://172.22.48.1:5075/api/test/foo") 
  local res_headers, res_stream = new_request:go(100);
  if res_headers then
   for lua_field, lua_value in res_headers:each()
    do
     kong.log.debug("field: " .. lua_field .. " value: " .. lua_value)
    end
  end
  local res_body = assert(res_stream:get_body_as_string())
  kong.log.debug("body:" .. res_body)
end

local function resquest_resty_http()
  local httpc = require("resty.http").new()

  local ok, err = httpc:connect({
    scheme = "http",
    host = "172.22.48.1",
    port = 5075,
    pool = "kongpool",
    pool_size = 20
    })
  if ok then
    kong.log.debug("connected ok")
  else
    kong.log.debug("connect err: " .. err)
    return
  end

  local res, err1 = httpc:request({
    method = "GET",
    path = "/api/test/foo",
    headers = {
      ["Host"] = "172.22.48.1:5075",
    },
  })

  if err1 then
    kong.log.debug("err: " .. err1)
  end

  if not res then
    kong.log.debug("res is nil")
  else
    local response_body = res:read_body()
    local status = res.status
    kong.log.debug("read body status: " .. status .. " body: " .. response_body)
  end
end

function AsheauthHandler:access(conf)
   
end

function AsheauthHandler:header_filter(conf)   
   
end

function AsheauthHandler:rewrite(conf)   
  kong.log.debug("enter rewrite")   

  resquest_resty_http()
  reques_http()

  kong.log.debug("rewrite OK")   
end



return AsheauthHandler
