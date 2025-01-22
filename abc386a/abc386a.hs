{-# LANGUAGE OverloadedStrings #-}

import Data.Bool (bool)
import qualified Data.IntSet as IS

main :: IO ()
main = solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String
solve = bool "No" "Yes" . (== 2) . IS.size . IS.fromList
