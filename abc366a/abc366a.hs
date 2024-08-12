{-# LANGUAGE OverloadedStrings #-}

import Data.Bool (bool)

main :: IO ()
main = solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String
solve [n, t, a] = bool "No" "Yes" $ 2 * t > n || 2 * a > n
