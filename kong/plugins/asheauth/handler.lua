local AsheauthHandler = {
  PRIORITY = 900,
  VERSION = "1.0"
}

function AsheauthHandler:access(conf)
   
end

function AsheauthHandler:header_filter(conf)   
   
end

function AsheauthHandler:rewrite(conf)   
  kong.log.debug("enter rewrite")   

  local httpc = require("resty.http").new()

  local ok, err = httpc:connect({
    scheme = "http",
    host = "127.0.0.1",
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
      ["Host"] = "localhost:5075",
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
    kong.log.debug("read body status: " .. status .. " body: " .. body)
  end

  kong.log.debug("rewrite OK")   
end



return AsheauthHandler
