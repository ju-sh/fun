main = do
    putStrLn "Enter your name: "
    name <- getLine
    putStrLn ("Hi " ++ name ++ "! Good day.")
