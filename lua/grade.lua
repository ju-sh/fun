marks = io.read()
marks = tonumber(marks)

if marks>=90 then
  grade = 'A'
elseif marks>=80 then
  grade = 'B'
elseif marks>=50 then
  grade = 'C'
else
  grade = 'D'
end

print(grade)
