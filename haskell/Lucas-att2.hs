{-
 - Levels on top are of smaller index.
 -}
nBaseB
  :: Int
  -> Int
  -> [Int]
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

nCkBin
  :: (Int, Int)
  -> Int
nCkBin (0, 1) = 0
nCkBin _ = 1

nCr
  :: Int
  -> Int
  -> Int
nCr a b = product $ map nCkBin $ zip apad bpad
 where
  abin = nBaseB a 2
  bbin = nBaseB b 2
  alen = length abin
  blen = length bbin
  maxlen = max alen blen
  apad = abin ++ replicate (maxlen-alen) 0
  bpad = bbin ++ replicate (maxlen-blen) 0

oneLine
  :: Int
  -> [Int]
oneLine lvl = [nCr lvl r | r <- [0..lvl]]

allLines
  :: Int
  -> [[Int]]
allLines maxLvl = [oneLine i | i <- [0..maxLvl]]

fmtOneLine
  :: Int
  -> Int
  -> String
fmtOneLine maxLvl lvl = begg ++ bodyhead ++ bodytail
 where
  begg = replicate (maxLvl-lvl) ' '
  digitstr = map show $ oneLine lvl
  bodyhead = head digitstr
  bodytail = foldl (++) "" $ map ((++) " ") $ tail digitstr

fmtAllLines
  :: Int
  -> String
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
