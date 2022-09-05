add2 :: Float -> Float -> (Float -> a) -> a
add2 x2 y2 f = f (x2 + y2)

sqre :: Float -> (Float -> a) -> a
sqre x f = f (x * x)

sqroot :: Float -> (Float -> a) -> a
sqroot x f = f (sqrt x)

halt :: Float -> IO ()
halt x = print x

example :: Float -> Float -> (Float -> a) -> a
example x y cont =
  sqre x
  (\x2 -> sqre y
          (\y2 -> add2 x2 y2
                  (\x2y2 -> sqroot x2y2 cont)
          )
  )
{-
*Main> example 3 4 halt
5.0
-}

