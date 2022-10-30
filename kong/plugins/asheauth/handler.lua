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

  local res, err = httpc:request_uri("https://www.microsoft.com/en-us", {
    method = "GET"    
  })
  
  if not res then
    kong.log.debug("res is nil")
    return
  else
    local response_body = res:read_body()
    kong.log.debug("status: " .. res.status .. "Body: " .. response_body)  
  end

  kong.log.debug("rewrite OK")   
end



return AsheauthHandler
