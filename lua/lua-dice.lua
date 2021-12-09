require "math"

if package.loaded.math then
  print("math module loaded.")
else
  print("math module not loaded.")
end

math.randomseed(00)

--generate a random number between in the interval [1,6] and 
--continue looping till you get a 6
local counter = 0

repeat
  local n = math.random(6)
  print("N: " .. tostring(n))
  counter = counter + 1
until n==6

print("Counter: " .. counter)
