local CustomHandler = {
    VERSION  = "1.0.0",
    PRIORITY = 10,
  }
  
  function CustomHandler:access(config)
    -- Implement logic for the access phase here (http)
    kong.log("access")
  end
  
  -- return the created table, so that Kong can execute it
  return CustomHandler