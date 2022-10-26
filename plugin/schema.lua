local typedefs = require "kong.db.schema.typedefs"


return {
  name = "ashe-auth",
  fields = {
    {
      route = typedefs.no_route,
    },
    {
      service = typedefs.no_service,
    },
    {
      consumer = typedefs.no_consumer,
    },
    {
      protocols = typedefs.protocols_http,
    },
    {
      config = {
        type = "record",
        fields = {           
            { uncontrolled_routes = { type = "array", required = true, elements = "string" }, },
            { authorization_route = { type = "string", required = true}}
        },
      },
    },
  },
}
