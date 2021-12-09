function a ()
  io.write("a has spoken.\n")
  local who_next = io.read()
  if who_next=='p' then
    return p()
  elseif who_next=='q' then
    return q()
  elseif who_next=='a' or who_next=='b' then
    io.write("Team 1 already spoke!\n")
    a()
  elseif who_next=='timeup' then
    io.write("Debate is over. Thank you.\n")
  else
    io.write("No such speaker!\n")
    a()
  end 
end

function b ()
  io.write("b has spoken.\n")
  local who_next = io.read()
  if who_next=='p' then
    return p()
  elseif who_next=='q' then
    return q()
  elseif who_next=='a' or who_next=='b' then
    io.write("Team 1 already spoke!\n")
    b()
  elseif who_next=='timeup' then
    io.write("Debate is over.\n")
  else
    io.write("No such speaker!\n")
    b()
  end 
end

function p ()
  io.write("p has spoken.\n")
  local who_next = io.read()
  if who_next=='a' then
    return a()
  elseif who_next=='b' then
    return b()
  elseif who_next=='p' or who_next=='q' then
    io.write("Team 2 already spoke!\n")
    p()
  elseif who_next=='timeup' then
    io.write("Debate is over. Thank you\n")
  else
    io.write("No such speaker!\n")
    p()
  end 
end

function q ()
  io.write("q has spoken.\n")
  local who_next = io.read()
  if who_next=='a' then
    return a()
  elseif who_next=='b' then
    return b()
  elseif who_next=='p' or who_next=='q' then
    io.write("Team 2 already spoke!\n")
    q()
  elseif who_next=='timeup' then
    io.write("Debate is over.\n")
  else
    io.write("No such speaker!\n")
    q()
  end 
end

a()
