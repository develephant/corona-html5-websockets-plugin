--#############################################################################
--# Corona HTML5 Websockets Plugin
--# (c)2018 C. Byerley (develephant)
--#############################################################################
local ws = require("websockets")

local function WsListener(event)
  if event.type == ws.ONOPEN then
    print('connected')
    -- send a message
    ws.send("Hello")
  elseif event.type == ws.ONMESSAGE then
    print('message', event.data)
  elseif event.type == ws.ONCLOSE then
    print('disconnected')
  elseif event.type == ws.ONERROR then
    print('error', event.reason)
  end
end

--connection
ws.addEventListener(WsListener)
ws.connect('ws://demos.kaazing.com/echo')

--disconnection
timer.performWithDelay(5000, function()
  ws.disconnect()
  ws.removeEventListener(WsListener)
end)
