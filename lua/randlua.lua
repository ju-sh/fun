seednum = io.read()
math.randomseed(seednum)

local counter = 0
repeat 
  local n = math.random(6)
  print(n)
  counter = counter + 1
until n==6

print(counter)
