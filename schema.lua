local typedefs = require "kong.db.schema.typedefs"

return {
  name = "ashe-auth",
  fields = {
    { consumer = typedefs.no_consumer },
    { protocols = typedefs.protocols_http }
  },
}