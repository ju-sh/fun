require "io"
--input = io.read()
if package.loaded.io then
  print("io module loaded.")
else
  print("io module not loaded.")
end

--[[
s = "1950/01/26"
print(s:match("^%d+"))
_, i = s:find("^%d/")
print(_, i)
s = s:sub(i+1)
print(s)
--]]

-- s = "01-Mar-2018"
-- s:match("^%d%d",
