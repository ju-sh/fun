-- | Find number to base b
bin
  :: Int    -- ^ number n
  -> [Int]  -- ^ digits of n in binary as list. LSB first.
bin n
  | n==0 = [0]
  | otherwise = helper n
 where
  helper n
    | n==0 = []
    | otherwise = rem:helper nxt
   where
    rem = mod n 2
    nxt = quot n 2

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
  abin = bin a
  bbin = bin b
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
