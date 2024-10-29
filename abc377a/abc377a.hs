{-# LANGUAGE OverloadedStrings #-}
import Data.List (sort)
import Data.Bool (bool)

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = bool "No" "Yes" . (== "ABC") . sort
