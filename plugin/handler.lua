local CustomAuthorization = {
  PRIORITY = 900,
  VERSION = "1.0"
}

function CustomAuthorization:access(conf)
  kong.log.debug("response ok XXXX")  
end

function CustomAuthorization:header_filter(conf)   
  kong.log.debug("response ok XXXX")   
  kong.response.set_header("Add-By-My-Kong-Plugin", kong.router.get_route())
end --]]



return CustomAuthorization
