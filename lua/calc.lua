io.write("Enter the operator: ")
op = io.read()
if op~='+' and op~='-' and op~='*' and op~='/' and op~='%' then
  io.write("Invalid operation!") 
else
  io.write("Enter 2 nos: \n")
  a = io.read()
  if tonumber(a)==nil then
    io.write("Invalid operand!")
    return
  end
  b = io.read()
  if tonumber(b)==nil then
    io.write("Invalid operand!")
    return
  end
  if op=='+' then
    res = a+b
  elseif op=='-' then
    res = a-b
  elseif op=='*' then
    res = a*b
  elseif op=='/' then
    if b==0 then
      io.write("Divide by zero error!")
      return
    end
    res = a/b
  end
  io.write("Result: " .. res .. "\n")
end
