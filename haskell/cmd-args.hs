import System.Environment

main = do
    args <- getArgs
    progName <- getProgName
    putStrLn "Prog name:"
    putStrLn progName
    putStrLn "Args:"
    mapM putStrLn args  

{-
./a.out hello world

-----

Prog name:
a.out
Args:
hello
world
-}
