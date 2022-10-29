local http = require "resty.http"

local AsheauthHandler = {
  PRIORITY = 900,
  VERSION = "1.0"
}

function AsheauthHandler:access(conf)
  kong.log.debug("response ok XXXX")  
end

function AsheauthHandler:header_filter(conf)   
  kong.log.debug("response ok XXXX")   

  local httpc = http:new()

  kong.response.set_header("ENTRO", "ok") 
end



return AsheauthHandler
