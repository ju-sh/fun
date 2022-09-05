-- | Find number to base b
base
  :: Int    -- ^ base
  -> Int    -- ^ number n
  -> [Int]  -- ^ digits of n to the base n. LSB first.
base b 0 = [0]
base b n
  | n < b = [n]
  | otherwise = rem:base b nxt
     where
      rem = mod n b
      nxt = quot n b

-- | Reverse a list
revList
  :: [a]  -- ^ Input list
  -> [a]  -- ^ output list
revList l = helper [] l
 where
  helper l [] = l
  helper l (x:xs) = x:(helper l xs)

listToStr
  :: Show a
  => [a]     -- ^ Input list
  -> String  -- ^ Equivalent string
listToStr l = foldl (++) "" $ map show l

{-
*Main> listToStr $ revList $ base 2 18
"01001"
-}
