days = {"sun",
"mon", 
"tue", 
"wed",
"thu",
"fri",
"sat"}

rev_days = {}
for index, value in ipairs(days) do
  rev_days[value] = index
end

input = io.read()
print( rev_days[input] )
