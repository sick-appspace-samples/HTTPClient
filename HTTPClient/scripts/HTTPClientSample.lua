
-- Configuration for connection to the server

local httpServer = 'http://www.spiegel.de'
local httpsServer = 'https://www.sick.com/de/de'
local client

local function performHttpGetRequest(url)
  -- Create HTTPClient handle
  client = HTTPClient.create()
  if not client then
    print('Error creating handle')
    return
  end

  -- Configure proxy (if needed)
  --[[
  client:setProxy("my.proxy.address", 80)
  client:setProxyAuth("username", "password")
  --]]
  -- Setup certificate authority bundle. You can download this bundle from the
  -- curl website https://curl.haxx.se/docs/caextract.html
  client:setCABundle('resources/cacert.pem')
  client:setPeerVerification(true)
  client:setHostnameVerification(false)

  -- Create request
  local request = HTTPClient.Request.create()
  request:setURL(url)
  -- The port is selected automatically based on the protocol (http/https) but
  -- can be set manually if needed by uncommenting this line:
  -- request:setPort(port)
  request:setMethod('GET')

  -- Execute request
  local response = client:execute(request)

  -- Check success
  local success = response:getSuccess()
  if not success then
    local error = response:getError()
    local errorDetails = response:getErrorDetail()
    print('Error: ' .. error)
    print('Detail: ' .. errorDetails)
  end

  if success then
    -- Print HTTP Status code
    print('Status code: ' .. response:getStatusCode())

    -- Output HTTP response headers
    for _, v in ipairs(response:getHeaderKeys()) do
      local _, values = response:getHeaderValues(v)
      print(string.format('  > %s: %s', v, table.concat(values, ', ')))
    end

    -- Output content summary
    print(
      string.format('\nReceived %d bytes\n', string.len(response:getContent()))
    )
  -- .. or content itself by uncommenting this line:
  -- print(response:getContent())
  end
end

performHttpGetRequest(httpServer)
performHttpGetRequest(httpsServer)
