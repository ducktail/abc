{-# LANGUAGE OverloadedStrings #-}

import Data.Char (digitToInt)

main :: IO ()
main = solve <$> getLine >>= print

solve :: String -> Int
solve [a, _, b]= digitToInt a * digitToInt b
