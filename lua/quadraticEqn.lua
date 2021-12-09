function readNumber ()
  local a = io.read()
  if tonumber(a) == nil then
    os.exit()
  else
    return a
  end
end


io.write("Enter a, b and c: ")
local a = readNumber()
local b = readNumber()
local c = readNumber()
io.write("a: " .. a .. ", b: " .. b .. ", c: " .. c .. "\n")
d = b^2 - 4*a*c
io.write("Discriminant: " .. d)
if d>0 then
--5,6,1 => -0.2 and -1
  print('Real distinct roots')  
  local r1 = (-b + math.sqrt(d))/(2*a)
  local r2 = (-b - math.sqrt(d))/(2*a)
  print("Roots are " .. r1 .. " and " .. r2 .. "\n")
elseif d<0 then
--5,2,1 => -0.2 +/- 0.4i
  print('Complex roots.')
else
  print('Real equal roots.')
  local r1 = (-b + math.sqrt(d))/(2*a)
  print("Roots are " .. r1 .. " and " .. r1 .. "\n")
end

