{-# LANGUAGE OverloadedStrings #-}

import Data.List(sort)
import Data.Bool (bool)

main :: IO ()
main = solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String
solve = bool "No" "Yes" . f . sort
  where
    f [a, b, c] = a * b == c
