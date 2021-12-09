co = coroutine.create( function () 
  for i=4, 7 do
    coroutine.yield(i, i^2)
  end
end)

for i=4,7 do
  print(coroutine.resume(co))
  --io.write(coroutine.resume(co))
end


