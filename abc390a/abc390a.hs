{-# LANGUAGE OverloadedStrings #-}

import Data.Bool (bool)

main :: IO ()
main = solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String
solve as = bool "No" "Yes" $ any (== as) ls
  where
    ls = [[2,1,3,4,5],
          [1,3,2,4,5],
          [1,2,4,3,5],
          [1,2,3,5,4]]
