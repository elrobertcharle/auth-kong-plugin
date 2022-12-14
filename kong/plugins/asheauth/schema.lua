local typedefs = require "kong.db.schema.typedefs"


return {
  name = "asheauth",
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
            { authorization_url = { type = "string", required = true}},       
        },
      },
    },
  },
}
