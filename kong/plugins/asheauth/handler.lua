local http = require "resty.http"

local AsheauthHandler = {
  PRIORITY = 900,
  VERSION = "1.0"
}

function AsheauthHandler:access(conf)
  kong.log.debug("response ok XXXX")  
end

function AsheauthHandler:header_filter(conf)   
  kong.log.debug("response ok YYYY")     
end

function AsheauthHandler:rewrite(conf)   
  kong.log.debug("enter rewrite")   

  local httpc = http:new()

  local res, err = httpc:request_uri("https://localhost:7075/api/test/foo", {
    method = "GET",
  })
  
  if err then
    kong.log.debug("err: " .. err)
  end
  if not res then
    kong.log.debug("res is nil")
    return
  else
    local status = res.status
    local body   = res.body

    kong.log.debug("read body status: " .. status .. " body: " .. body)
  end

  kong.log.debug("rewrite OK")   
end



return AsheauthHandler
