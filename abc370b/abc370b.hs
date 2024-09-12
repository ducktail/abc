{-# LANGUAGE OverloadedStrings #-}
import Control.Monad
import Data.Array.Unboxed ((!), array, UArray)

main :: IO ()
main = do
  n <- readLn
  solve n <$> replicateM n f >>= print
  where
    f = map read <$> words <$> getLine

solve :: Int -> [[Int]] -> Int
solve n ass = foldl (\i j -> if i >= j then a ! (i, j) else a ! (j, i)) 1 [1..n]
  where
    a :: UArray (Int, Int) Int
    a = array ((1,1), (n, n)) $ do
      (i, as) <- zip [1..n] ass
      (j, a) <- zip [1..n] as
      return ((i, j), a)
