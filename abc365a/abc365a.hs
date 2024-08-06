{-# LANGUAGE OverloadedStrings #-}
import Data.Bool (bool)

main :: IO ()
main = solve <$> readLn >>= print

solve :: Int -> Int
solve = bool 365 366 . isLeapYear

isLeapYear :: Int -> Bool
isLeapYear y = y `mod` 400 == 0 || y `mod` 100 /= 0 && y `mod` 4 == 0
