-- | Demo of state monad

import Data.Char
import GHC.Float
import Control.Monad.State


-- | Process next input character
chrToOp
  :: (Num a, Fractional a)
  => Char           -- ^ Character denoting an operation
  -> (a -> a -> a)  -- ^ Function corresponding to the operation

chrToOp ch =
  case ch of
    '+' -> (+)
    '-' -> (-)
    '*' -> (*)
    '/' -> (/)


-- | Process next input character
process_inp
  :: Char     -- ^ Next input character
  -> [Float]  -- ^ Current state of stack
  -> [Float]  -- ^ New state of stack

process_inp ch st
  | isDigit ch     = [int2Float $ digitToInt ch] ++ st
  | elem ch "+-*/" = [(chrToOp ch) (st!!1) (st!!0)] ++ (tail (tail st))
  | otherwise  = st


postfixeval
  :: String               -- ^ Input string
  -> State [Float] Float

postfixeval [] = do
  st <- get
  return $ head st

postfixeval (x:xs) = do
  st <- get
  let newst = process_inp x st
  put newst
  postfixeval xs

-- main = print $ fst $ runState (postfixeval "32+") []
main = do
  putStrLn "Enter the postfix expression:"
  inp <- getLine
  print $ fst $ runState (postfixeval inp) []


{-
λ> fst $ runState (postfixeval "32+2*6-2/") []
2.0

λ> fst $ runState (postfixeval "32+") []
-}

{- 
Enter the postfix expression:
32+
5.0

Enter the postfix expression:
32+2*6-2/
2.0
-}
