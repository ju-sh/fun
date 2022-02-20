{- | Find factorial -}
fact :: Int  -- ^ Integer whose factorial is to be found
     -> Int  -- ^ Factorial value
fact n
  | n > 1  = n * fact (n - 1)
  | n <= 1 = 1

{- | No error handling


Used div instead of / to get integer result instead of float.

Example:

    > p 9 4
    3024
-}
p :: Int  -- ^ n
  -> Int  -- ^ r
  -> Int  -- ^ nPr
p n r
  | n > r && r >= 0 = (fact n) `div` fact (n - r)
--  | n == (r + 1)  = 1
--  | n > r         = n * (p (n-1) r)

{- | No error handling

Example:

-}
c :: Int  -- ^ n
  -> Int  -- ^ r
  -> Int  -- ^ nCr
c n r = (p n r) `div` (fact r)
