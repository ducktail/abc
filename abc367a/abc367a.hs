{-# LANGUAGE OverloadedStrings #-}
import Data.Bool (bool)

main :: IO ()
main = solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String
solve = bool "No" "Yes" . f
  where
    f [a, b, c]
      | b < c = a < b || c < a
      | otherwise = c < a && a < b
