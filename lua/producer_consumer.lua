function send (n)
  coroutine.yield(n)
end

function receive ()
  local status, n = coroutine.resume(producer)
  return value
end

producer = coroutine.create(
  function () 
    local n = io.read()
    send(n)
  end
)


consumer = coroutine.create(
  function () 
    local n = receive()
  end
)


--[[
producer = coroutine.create(
  function ()
    io.write("Enter sth: ")
    local n = io.read()
    io.write("Yielding producer. Over to consumer...\n")
    coroutine.yield(n)
  end
)

consumer = coroutine.create(
  function (n)
    local n = coroutine.resume(producer)
    io.write("Consumer got '", n, "' from producer.\n")
    io.write("Resuming producer...\n")
    coroutine.resume(producer)
  end
)

function fn ()
  local n = coroutine.resume(producer)
  coroutine.consumer( )
end

coroutine.resume(producer)
]]--



--[[
producer = coroutine.create(
  function ()
    while true do
      local x = io.read() --produce new value
      send(x)
    end
  end)
]]--
