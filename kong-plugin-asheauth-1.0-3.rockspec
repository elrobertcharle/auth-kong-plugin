package = "asheauth"
version = "1.0-3"

source = {
  url = "https://github.com/elrobertcharle/auth-kong-plugin.git"
}

description = {
  summary = "Ya tu sabes",
  license = "MIT"
}

dependencies = {
  "lua ~> 5.1"
}

build = {
  type = "builtin",
  modules = {
    ["kong.plugins.asheauth.handler"] = "kong/plugins/asheauth/handler.lua",
    ["kong.plugins.asheauth.schema"] = "kong/plugins/asheauth/schema.lua",
  }
}