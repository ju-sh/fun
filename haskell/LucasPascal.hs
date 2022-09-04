module Main where

{-
 - Level indexing starts from zero.
 - Levels on top are of smaller index.

Level 0  |        1
Level 1  |       1 1
Level 2  |      1 0 1
Level 3  |     1 1 1 1
Level 4  |    1 0 0 0 1
 -}

-- | Find number to base b
nBaseB
  :: Int    -- ^ base
  -> Int    -- ^ number n
  -> [Int]  -- ^ digits of n to the base n. LSB first.
nBaseB n b
  | n < b = [n]
  | otherwise = rem:nBaseB nxt b
     where
      rem = mod n b
      nxt = quot n b
{-
*Main> nBaseB 15 2
[1,1,1,1]

*Main> nBaseB 16 2
[0,0,0,0,1]

*Main> nBaseB 16 3
[1,2,1]
-}

-- | Find value for aCb where a and b ∈ {0, 1}
nCkBin
  :: (Int, Int)  -- ^ a and b values as tuple
  -> Int         -- ^ aCb value
nCkBin (0, 1) = 0
nCkBin _ = 1

-- | Calculate nCr value
nCr
  :: Int   -- ^ n
  -> Int   -- ^ r
  -> Int   -- ^ nCr
nCr a b = product $ map nCkBin $ zip apad bpad
 where
  abin = nBaseB a 2
  bbin = nBaseB b 2
  alen = length abin
  blen = length bbin
  maxlen = max alen blen
  apad = abin ++ replicate (maxlen-alen) 0
  bpad = bbin ++ replicate (maxlen-blen) 0

-- | Find values for one level
oneLine
  :: Int    -- ^ current level
  -> [Int]  -- ^ values of the level
oneLine lvl = [nCr lvl r | r <- [0..lvl]]

-- | Find values of all levels
allLines
  :: Int      -- ^ maximum level
  -> [[Int]]  -- ^ values of levels. Values of each level is in a separate list
allLines maxLvl = [oneLine i | i <- [0..maxLvl]]

-- | Find values of a level and format it as a string
fmtOneLine
  :: Int     -- ^ maximum level
  -> Int     -- ^ current level
  -> String  -- ^ formatted string
fmtOneLine maxLvl lvl = begg ++ bodyhead ++ bodytail
 where
  begg = replicate (maxLvl-lvl) ' '
  digitstr = map show $ oneLine lvl
  bodyhead = head digitstr
  bodytail = foldl (++) "" $ map ((++) " ") $ tail digitstr


-- | Find values of the entire Pascal triangle and format it as a string
fmtAllLines
  :: Int     -- ^ maximum level
  -> String  -- ^ formatted, read-to-print, string
fmtAllLines maxLvl = foldl (++) ""  $ map ((++) "\n") strLines
 where
  strLines = [fmtOneLine maxLvl lvl | lvl <- [0..maxLvl]]

main = do
  putStrLn "Enter max level:"
  maxLevelStr <- getLine
  let maxLevel = read maxLevelStr :: Int
  let ll = allLines maxLevel
  putStrLn $ fmtAllLines maxLevel

{-
Enter max level:
32

                                1
                               1 1
                              1 0 1
                             1 1 1 1
                            1 0 0 0 1
                           1 1 0 0 1 1
                          1 0 1 0 1 0 1
                         1 1 1 1 1 1 1 1
                        1 0 0 0 0 0 0 0 1
                       1 1 0 0 0 0 0 0 1 1
                      1 0 1 0 0 0 0 0 1 0 1
                     1 1 1 1 0 0 0 0 1 1 1 1
                    1 0 0 0 1 0 0 0 1 0 0 0 1
                   1 1 0 0 1 1 0 0 1 1 0 0 1 1
                  1 0 1 0 1 0 1 0 1 0 1 0 1 0 1
                 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
                1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1
               1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1
              1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1
             1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1
            1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1
           1 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0 1 1
          1 0 1 0 1 0 1 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0 1
         1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1
        1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1
       1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1
      1 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0 1
     1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1
    1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1
   1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
  1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
-}
