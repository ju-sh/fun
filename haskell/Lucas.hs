module Lucas where

-- | nCkBin
nCkBin1
  :: Int -- ^ n
  -> Int -- ^ k
  -> Int -- ^ n choose k
nCkBin1 0 1 = 0
nCkBin1 _ _ = 1

--foldl nCkBin $ zip [1,1,1] [0,1,1]

-- | nCkBin
nCkBin
  :: (Int, Int) -- ^ n,k
  -> Int -- ^ n choose k
nCkBin (0,1) = 0
nCkBin _ = 1

nCk
  :: Int  -- ^ n
  -> Int  -- ^ k
  -> Int  -- ^ nck
nCk n k = mod (foldl (*) 1 $ map nCkBin $ zip nbinp kbinp) 2
 where
  nbin = bin n
  kbin = bin k
  n1 = length nbin
  n2 = length kbin
  pad1 = replicate (n2-n1) 0
  pad2 = replicate (n1-n2) 0
  nbinp = pad1 ++ nbin
  kbinp = pad2 ++ kbin
--nCk n k = mod (foldl (*) 1 $ map nCkBin $ zip [1,1,1] [0,1,1]) 2


-- | Find all values for one level
valOneline
  :: Int    -- ^ n
  -> [Int]  -- ^ list of nCi values
valOneline n = [nCk n k | k <- [0..n]]

-- | Find values for all levels
valAllLines
  :: Int     -- ^ limit
  -> [[Int]] -- ^ list of values in levels
valAllLines lim = [valOneline n | n <- [0..lim]]



-- *Lucas> [[(n,k) | k <- [0..n]] | n <- [0..3] ]
-- [[(0,0)],[(1,0),(1,1)],[(2,0),(2,1),(2,2)],[(3,0),(3,1),(3,2),(3,3)]]

-- *Lucas> foldl (++) "" $ map show [1,2]
-- "12"

-- *Lucas> map ( (++) " ") $ map show [1,2]
-- [" 1"," 2"]

-- *Lucas> foldl (++) "" $ map ((++) "  ") $ map show [1,2]
-- "  1  2"

-- Prelude> concat $ replicate 4 "as"
-- "asas"

-- Prelude> [1..4] >>= const "hi"
-- "hihihihi"



fmtOneLine
  :: Int    -- ^ Current level. Early lines have larger level. (Think of it as a buiildng)
  -> [Int]  -- ^ values of current line
  -> String -- ^ fmtAllLinesut line
fmtOneLine i l = begg ++ begg ++ body
 where
  begg = replicate (2*(i-1)) ' '
  body = foldl (++) "" $ map ((++) "  ") $ map show l

fmtAllLines
  :: Int     -- ^ limit
  -> [[Int]] -- ^ data that has already been calculated
  -> String
fmtAllLines lastlvl ll = foldl (++) "" $ map ((++) "\n") $ [fmtOneLine i l | (i,l) <- zip [lastlvl,lastlvl-1..0] ll]
--fmtAllLines lastlvl ll = foldl (++) "" $ map ((++) "\n") $ [fmtOneLine i l | i <- [lastlvl,lastlvl-1..0], l <- ll]

interface
  :: Int     -- ^ Largest level
  -> String  -- ^ formatted string 
interface n = fmtAllLines n ll
 where
  ll = valAllLines n

--[ (3,x) | x <- [0..3]]


bin :: Int -> [Int]
bin = go [] where
   go acc 0 = acc
   go acc n = let (d, m) = n `divMod` 2 in go (m : acc) d
