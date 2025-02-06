{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = (: "UPC") . head
