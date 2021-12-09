function player_fn_builder_fn (player)
  return function ()
           local a, b, c
           io.write("Player ", player, "'s turn:\n")  
           a = math.random(1,6)
           b = math.random(1,6)
           c = math.random(1,6)
           io.write("Die vals: ", a, ", ", b, ", ", c, "\tTotal: ", a+b+c, "\n")
           return a+b+c
         end
end

score = {a = 12, b = 12}
no_of_iterations = 0

afn = player_fn_builder_fn("John")
bfn = player_fn_builder_fn("Jack")

while score.a>0 and score.b>0 do
  local a = afn()
  local b = bfn()
  if a==11 and b~=14 then --only if the other hasn't scored
    score.a = score.a + 1 
    score.b = score.b - 1
    io.write("A scored! Scores: A: ", score.a, " B: ", score.b, "\n")
  elseif a~=11 and b==14 then
    score.b = score.b + 1 
    score.a = score.a - 1 
    io.write("B scored! Scores: A: ", score.a, " B: ", score.b, "\n")
  end
  io.write("\n")
  no_of_iterations = no_of_iterations + 1
  --io.stdin:read'*l'
end

if a==0 then
  io.write("B won. A ruined.\n");
else
  io.write("A won. B ruined.\n");
end

io.write("No. of iterations: ", no_of_iterations, "\n")
