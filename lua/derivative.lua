function deriv(fn, change)
  --change = change or 1e-3
  change = change or 0.001 
  return 
    function (val)
      return (fn(val + change) - fn(val))/change
    end
end

d = deriv(math.sin) -- which should be approximately math.cos
io.write("d: "..d(10)..", math: "..math.cos(10))

-- Output is:
-- d: -0.83879937869802, math: -0.83907152907645
-- approximately the same. You can try the other way around as well if you like.
