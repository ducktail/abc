{-# LANGUAGE OverloadedStrings #-}
import Data.List(isSuffixOf)
import Data.Bool (bool)

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = bool "No" "Yes" . isSuffixOf "san"
