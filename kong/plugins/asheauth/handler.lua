local http = require "resty.http"

local AsheauthHandler = {
  PRIORITY = 900,
  VERSION = "1.0"
}

local function reques_http(auth_url, st)
  local request = require "http.request"
  local new_request= request.new_from_uri(auth_url) 
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



local function resquest_resty_http(auth_url, st)
  local httpc = http:new()
  local res, req_err = httpc:request_uri("http://localhost:5075/api/auth/validate-st", {
    method = "GET",
    ssl_verify = false,
    headers = {["st"] = st}
  })

  if req_err then
    kong.log.debug("req_err: " .. req_err)
    return 500
  end

  if res then
    local status = res.status
    local response_body = res:read_body()
    if not res_body then
      res_body=""      
    end
    kong.log.debug("read body status: " .. status .. " body: " .. response_body)
    return status   
  else
    kong.log.debug("res is nil")
    return 500
  end
end

local function resquest_resty_http2(st)
  local httpc = require("resty.http").new()

  local ok, err = httpc:connect({
    scheme = "http",
    host = "172.22.48.1",
    port = 5075,
    })
  if ok then
    kong.log.debug("connected ok")
  else
    kong.log.debug("connect err: " .. err)
    return 500
  end

  local res, req_err = httpc:request({
    method = "GET",
    path = "/api/auth/validate-st",
    headers = {
      ["st"] = st,
    },
  })

  if req_err then
    kong.log.debug("req_err: " .. req_err)
    return 500
  end

  if res then
    local status = res.status
    local response_body = res:read_body()
    if not res_body then
      res_body=""      
    end
    kong.log.debug("read body status: " .. status .. " body: " .. response_body)
    return status   
  else
    kong.log.debug("res is nil")
    return 500
  end
end


function AsheauthHandler:access(conf)
  kong.log.debug("enter access")
  kong.log.debug("authorization_url: " .. conf.authorization_url)
  kong.log.debug("uncontrolled_routes: " .. (conf.uncontrolled_routes or ""))   
  local ck = require "resty.cookie"
  if not ck then
   kong.log.debug("resty.cookie is not installed")
   return
  end

  local cookie = ck:new()
  local st, cookie_err = cookie:get("st")
  if cookie_err then
   kong.log.debug("cookie err: " .. cookie_err)
  end
 
  --local st = kong.request.get_headers()["st"]
  if not st then
    kong.response.exit(401)
  else
    kong.log.debug("st: " .. st)
  end

 --local status= resquest_resty_http(conf.authorization_url, st)
 local status= resquest_resty_http2(st)
 if status~=200 then
  kong.response.exit(status)
 end
  -- reques_http()

  kong.log.debug("access passed OK")    
end

function AsheauthHandler:header_filter(conf)   
   
end

function AsheauthHandler:rewrite(conf)   
 
end



return AsheauthHandler
