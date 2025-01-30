{-# LANGUAGE OverloadedStrings #-}

import Data.Vector.Unboxed (Vector, (!), (//))
import qualified Data.Vector.Unboxed as V

main :: IO ()
main = solve <$> readLn >>= print

solve :: Int -> Int
solve n = 2025 - (v ! n)
  where
    v = foldl (\x i ->
                 foldl (\y j ->
                          y // [(i * j, y ! (i * j) + i * j)]
                       ) x [1..9]
              ) (V.replicate 82 0) [1..9]
