{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = map opDir

opDir :: Char -> Char
opDir 'N' = 'S'
opDir 'S' = 'N'
opDir 'E' = 'W'
opDir 'W' = 'E'
opDir _ = ' '
