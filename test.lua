local uri = assert(arg[1], "URI needed")
local req_timeout = 10

local request = require "http.request"

local req = request.new_from_uri(uri)

print("# REQUEST")
print("## HEADERS")
for k, v in req.headers:each() do
	print(k, v)
end
print()


print("# RESPONSE")
local headers, stream = req:go(req_timeout)

print("## HEADERS")
if headers then
 for k, v in headers:each() do
	print(k, v)
 end
end
print()
print("## BODY")
local body, err = stream:get_body_as_string()
if not body and err then
	io.stderr:write(tostring(err), "\n")
	os.exit(1)
end
print(body)
print()