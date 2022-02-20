import Data.Dynamic
-- import Data.Maybe

type Result = [Row]
type Row = HList
type HList = [Dynamic]

angus = [ toDyn 42, toDyn True]

--hCount :: Typeable a => HList -> [a]

-- Haskell record
data Unpriced = Unpriced { key :: Integer
                         , name :: String }

angus = Unpriced { key = 42
                 , name = "angus" }

-- > key angus
-- 42
-- > name angus
-- angus

-- Update record
notAngus = angus { key = 32 }
-- > key angus
-- 32
-- > name angus
-- angus

