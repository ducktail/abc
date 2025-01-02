{-# LANGUAGE OverloadedStrings #-}

import Control.Monad (replicateM)
import Data.Vector.Unboxed (Vector, (!), (//))
import qualified Data.Vector.Unboxed as V

main :: IO ()
main = do
  [h, w, d] <- f
  solve h w d <$> replicateM h getLine >>= print
  where
    f = map read <$> words <$> getLine

dist (xi, yi) (xj, yj) =
  abs (xi - xj) + abs (yi - yj)

solve :: Int -> Int -> Int -> [String] -> Int
solve h w d ss = f mp 0 1 0 0 0
  where
    mp = V.fromList $ concat ss
    f mp i j k c mc
      | i >= h * w = mc
      | j >= h * w = f mp (i + 1) (i + 2) 0 c mc
      | k >= h * w = f mp i (j + 1) 0 0 (max c mc)
      | mp ! i == '.' &&
        mp ! j == '.' &&
        mp ! k == '.' && (dist (hi, wi) (hk, wk) <= d || dist (hj, wj) (hk, wk) <= d) = f mp i j (k + 1) (c + 1) mc
      | otherwise = f mp i j (k + 1) c mc
      where
        (hi, wi) = i `divMod` w
        (hj, wj) = j `divMod` w
        (hk, wk) = k `divMod` w
