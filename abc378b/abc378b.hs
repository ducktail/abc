{-# LANGUAGE OverloadedStrings #-}
import Control.Monad (replicateM, forM_)
import Data.Vector (Vector, (!))
import qualified Data.Vector as V

main :: IO ()
main = do
  n <- readLn
  qrs <- replicateM n f
  let tbl = V.fromList $ map (\[q, r] -> gomi q r) qrs :: Vector (Int -> Int)
  q <- readLn
  tds <- replicateM q f
  forM_ tds $ \[t, d] -> do
    print $ solve tbl t d
  where
    f = map read <$> words <$> getLine

solve :: Vector (Int -> Int) -> Int -> Int -> Int
solve tbl t d = (tbl ! (t - 1)) d

gomi :: Int -> Int -> Int -> Int
gomi q r d = (r - d) `mod` q + d
